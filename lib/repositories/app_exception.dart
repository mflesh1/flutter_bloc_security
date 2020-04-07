class AppException implements Exception {

  final int code;
  final List<String> messages;

  AppException([this.code, this.messages]);

  String getMessage() {
    return messages[0];
  }

}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(null, [message]);
}

class BadRequestException extends AppException {
  BadRequestException([String message]) : super(null, [message]);
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String message]) : super(null, [message]);
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(null, [message]);
}