import 'package:equatable/equatable.dart';

/// This class is abstract to allow condition the functional methods and allow capture the failure events

abstract class Failure extends Equatable {}

// This class capture the failure error the methods to fuctional level
class ErrorFailure extends Failure {
  final Object? error;
  final Object? code;

  ErrorFailure({
    this.error,
    this.code,
  });

  @override
  List<Object?> get props => [
        error,
        code,
      ];
}

// This class capture the failure error the methods to api call service
class ServerFailure extends Failure {
  final Object? message;
  final Object? code;

  ServerFailure({
    this.message,
    this.code,
  });

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}

//General failures

class CacheFailure extends Failure {
  final Object? message;
  final Object? code;

  CacheFailure({
    this.message,
    this.code,
  });

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}

class ConnectionFailure extends Failure {
  final Object? message;
  final Object? code;

  ConnectionFailure({
    this.message,
    this.code,
  });

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}

class AuthenticationFailure extends Failure {
  final Object? message;
  final Object? code;

  AuthenticationFailure({
    this.message,
    this.code,
  });

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}

class SynchronizationFailure extends Failure {
  final Object? message;
  final Object? code;

  SynchronizationFailure({
    this.message,
    this.code,
  });

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}

class DataBaseFailure extends Failure {
  final Object? message;
  final Object? code;

  DataBaseFailure({
    this.message,
    this.code,
  });

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}
