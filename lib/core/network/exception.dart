// This class is to capture the server events  that return Exception

class ServerException implements Exception {
  final String? message;
  final String? code;

  ServerException({
    this.message,
    this.code,
  }) : super();
}

class CacheException implements Exception {
  final String? message;
  final String? code;

  CacheException({
    this.message,
    this.code,
  }) : super();
}

class ConnectionException implements Exception {}

class AuthenticationException implements Exception {
  final String? message;
  final String? code;

  AuthenticationException({
    this.message,
    this.code,
  }) : super();
}

class SynchronizationException implements Exception {
  final String message;
  final String? code;

  SynchronizationException(
    this.message,
    this.code,
  );

  @override
  String toString() => "SynchronizationException: $message";
}

class DataBaseException implements Exception {
  final String? message;

  DataBaseException({
    this.message,
  }) : super();
}
