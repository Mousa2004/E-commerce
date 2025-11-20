sealed class AppException implements Exception {
  String? message;
  int? status;
  AppException({required this.message, this.status});
}

class NetworkException extends AppException {
  NetworkException({required super.message, super.status});
}

class ServerException extends AppException {
  ServerException({required super.message, super.status});
}

class UnKnownException extends AppException {
  UnKnownException({required super.message, super.status});
}
