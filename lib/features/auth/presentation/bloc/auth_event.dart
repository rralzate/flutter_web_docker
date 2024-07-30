part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class ShowPasswordEvent extends AuthEvent {
  final bool showPassword;

  const ShowPasswordEvent(this.showPassword);
  @override
  List<Object?> get props => [];
}

// -----------------------------------///-----------------------------------///Post to login in the app /// -----------------------------------/// -----------------------------------///
class PostLoginEmail extends AuthEvent {
  final String email;
  final String password;

  const PostLoginEmail({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class IsAuthenticatedEvent extends AuthEvent {
  final bool isAuthenticated;

  const IsAuthenticatedEvent({required this.isAuthenticated});
  @override
  List<Object?> get props => [isAuthenticated];
}

// -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// -----------------------------------///
// --------------------------------/// --------------------------------///GET USER information storage event /// -------------------------------/// -------------------------------///
class GetUserStorageInfoEvent extends AuthEvent {
  const GetUserStorageInfoEvent();

  @override
  List<Object> get props => [];
}

class LogOutUserEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
// -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///

