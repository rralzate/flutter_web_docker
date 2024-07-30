import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_web_docker/core/usescases/usescases.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/utils/constants.dart';

import '../../domain/entities/now_playing_response_entity.dart';

import '../../domain/entities/popular_response_entity.dart';
import '../../domain/usescases/get_on_display_movies_usecase.dart';
import '../../domain/usescases/get_popular_movies_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetOnDisplayMoviesUseCase getOnDisplayMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  MoviesBloc({
    required this.getOnDisplayMoviesUseCase,
    required this.getPopularMoviesUseCase,
  }) : super(MoviesInitial()) {
    on<GetOnDisplayMoviesEvent>((event, emit) async {
      emit(await _getOnDisplayMovies(event: event, emit: emit));
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      emit(await _getPopularMovies(event: event, emit: emit));
    });
  }

  //Method to getOnDisplayMovies
  Future<MoviesState> _getOnDisplayMovies({
    required GetOnDisplayMoviesEvent event,
    required Emitter<MoviesState> emit,
  }) async {
    emit(LoadingOnDisplayMoviesState());
    final user = await getOnDisplayMoviesUseCase(NoParams());

    return user.fold((failure) {
      emit(FailedOnDisplayMoviesState(
          error: _mapFailureToMessage(failure),
          message:
              failure.props.isNotEmpty ? failure.props.first.toString() : ''));

      return GetOnDisplayMoviesState(
        moviesEntity: NowPlayingResponseEntity.empty(),
      );
    }, (response) {
      emit(SuccessOnDisplayMoviesState(moviesEntity: response));

      return GetOnDisplayMoviesState(moviesEntity: response);
    });
  }

  //Method to getPopularMovies
  Future<MoviesState> _getPopularMovies({
    required GetPopularMoviesEvent event,
    required Emitter<MoviesState> emit,
  }) async {
    emit(LoadingPopularMoviesState());
    final user = await getPopularMoviesUseCase(NoParams());

    return user.fold((failure) {
      emit(FailedPopularMoviesState(
          error: _mapFailureToMessage(failure),
          message:
              failure.props.isNotEmpty ? failure.props.first.toString() : ''));

      return GetPopularMoviesState(
        moviesEntity: PopularResponseEntity.empty(),
      );
    }, (response) {
      emit(SuccessPopularMoviesState(moviesEntity: response));

      return GetPopularMoviesState(moviesEntity: response);
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
