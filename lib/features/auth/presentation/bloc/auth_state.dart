part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool showPassword;
  final bool isAuthenticated;
  final String token;
  const AuthState({
    this.showPassword = false,
    this.isAuthenticated = false,
    this.token = '',
  });

  AuthState copyWith({
    bool? showPassword,
    bool? isAuthenticated,
    String? token,
  }) =>
      AuthState(
        showPassword: showPassword ?? this.showPassword,
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
        token: token ?? this.token,
      );

  @override
  List<Object?> get props => [showPassword, isAuthenticated, token];
}

final class AuthInitial extends AuthState {}

//-----------------------------------/// -----------------------------------/// Class for login State /// -----------------------------------/// -----------------------------------///

class LoadingPostLoginEmailState extends AuthState {
  @override
  List<Object?> get props => [];
}

class FailedPostLoginEmailState extends AuthState {
  final String error;
  final String message;

  const FailedPostLoginEmailState({
    required this.error,
    required this.message,
  });
  @override
  List<Object?> get props => [
        error,
        message,
      ];
}

class PostLoginEmailState extends AuthState {
  final String tokenEntity;

  const PostLoginEmailState({
    required this.tokenEntity,
  });

  @override
  List<Object?> get props => [tokenEntity];

  @override
  String toString() {
    return '''
      Get Token: 
        Tolken: ${tokenEntity.toString()}
    ''';
  }
}

class SuccessPostLoginEmailState extends AuthState {
  final String tokenEntity;

  const SuccessPostLoginEmailState({
    required this.tokenEntity,
  });

  @override
  List<Object?> get props => [];
}

/// --------------------------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------
//  -------------------------/// ------------------------- Class for user storage  information State /// ----------------------------/// -----------------------------------///

class LoadingUserStorageInfoState extends AuthState {
  @override
  List<Object?> get props => [];
}

class FailedUserStorageInfoState extends AuthState {
  const FailedUserStorageInfoState();
  @override
  List<Object?> get props => [];
}

class GetUserStorageInfoState extends AuthState {
  final String tokenEntity;

  const GetUserStorageInfoState({
    required this.tokenEntity,
  });

  @override
  List<Object?> get props => [tokenEntity];

  @override
  String toString() {
    return '''
      Get Token: 
        Tolken: ${tokenEntity.toString()}
    ''';
  }
}

class SuccessUserStorageInfoState extends AuthState {
  final String tokenEntity;

  const SuccessUserStorageInfoState({
    required this.tokenEntity,
  });

  @override
  List<Object?> get props => [];
}

/// --------------------------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------

