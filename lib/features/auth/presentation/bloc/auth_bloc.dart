import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_web_docker/core/extensions/string_extension.dart';
import 'package:flutter_web_docker/core/usescases/usescases.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/usescases/get_auth_storage_usecase.dart';
import '../../domain/usescases/post_login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final PostLoginUseCase postLoginUseCase;
  final GetAuthStorageUseCase getAuthStorageUseCase;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //define controllers login
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();

  //get data
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get nameStream => _nameController.stream;

  AuthBloc({
    required this.postLoginUseCase,
    required this.getAuthStorageUseCase,
  }) : super(AuthInitial()) {
    on<ShowPasswordEvent>((event, emit) =>
        emit(state.copyWith(showPassword: event.showPassword)));

    on<PostLoginEmail>((event, emit) async {
      emit(await _postLogin(event: event, emit: emit));
    });

    on<IsAuthenticatedEvent>(
      (event, emit) => emit(state.copyWith(
        isAuthenticated: event.isAuthenticated,
      )),
    );

    on<GetUserStorageInfoEvent>((event, emit) async {
      emit(await _isUserLogin(event: event, emit: emit));
    });
  }

  //validation of logion Email
  void updateEmail(
    String userEmail,
  ) async {
    if (userEmail.isEmpty) {
      _emailController.sink.addError('Este campo es requerido');
    } else if (!userEmail.validateEmail) {
      _emailController.sink.addError('El correo electrónico no es correcto');
    } else {
      _emailController.sink.add(userEmail);
    }
  }

  //validation of Password form
  void updatePassword(
    String password,
  ) {
    if (password.isEmpty) {
      _passwordController.sink.addError('Este campo es requerido');
    } else {
      _passwordController.sink.add(password);
    }
  }

  //validation of name form
  void updateName(
    String name,
  ) {
    if (name.isEmpty) {
      _nameController.sink.addError('Este campo es requerido');
    } else {
      _nameController.sink.add(name);
    }
  }

  //check login validation form
  Stream<bool> get validateLoginForm => Rx.combineLatest2(
        emailStream,
        passwordStream,
        (a, b) => true,
      );

  //check login validation form
  Stream<bool> get validateRegisterForm => Rx.combineLatest3(
        emailStream,
        passwordStream,
        nameStream,
        (a, b, c) => true,
      );

  //Method to login into de application
  Future<AuthState> _postLogin({
    required PostLoginEmail event,
    required Emitter<AuthState> emit,
  }) async {
    emit(LoadingPostLoginEmailState());
    final user = await postLoginUseCase(ParamsUseCasePostLogin(
      userName: event.email,
      password: event.password,
    ));

    return user.fold((failure) {
      emit(FailedPostLoginEmailState(
          error: _mapFailureToMessage(failure),
          message:
              failure.props.isNotEmpty ? failure.props.first.toString() : ''));

      return const PostLoginEmailState(
        tokenEntity: '',
      );
    }, (response) {
      emit(SuccessPostLoginEmailState(tokenEntity: response.result));

      return PostLoginEmailState(tokenEntity: response.result);
    });
  }

  //Method to know if the user is logged in to the application
  Future<AuthState> _isUserLogin({
    required GetUserStorageInfoEvent event,
    required Emitter<AuthState> emit,
  }) async {
    emit(LoadingUserStorageInfoState());

    final tokenEntity = await getAuthStorageUseCase(NoParams());

    return tokenEntity.fold((failure) {
      emit(const FailedUserStorageInfoState());
      add(const IsAuthenticatedEvent(isAuthenticated: false));

      return const GetUserStorageInfoState(
        tokenEntity: '',
      );
    }, (response) {
      emit(SuccessUserStorageInfoState(tokenEntity: response.result));

      if (response.result.isNotEmpty) {
        add(const IsAuthenticatedEvent(isAuthenticated: true));
      }

      return GetUserStorageInfoState(tokenEntity: response.result);
    });
  }

  //Mapping of errors delivered by the server
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return Constants.serverFailureMessage;
      case const (CacheFailure):
        return Constants.cacheFailureMessage;
      case const (ConnectionFailure):
        return Constants.internetFailureMessage;
      case const (SynchronizationFailure):
        return Constants.synchronizationFailureMessage;
      case const (AuthenticationFailure):
        return Constants.authenticationFailureMessage;
      case const (ErrorFailure):
        return Constants.serverFailureMessage;

      default:
        return 'Unexpected error';
    }
  }
}
