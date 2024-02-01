sealed class AuthException implements Exception {
  final String message;

  AuthException(this.message);
}

final class AuthError extends AuthException {
  AuthError(super.message);
}

final class AuthUnauthorizedError extends AuthException {
  AuthUnauthorizedError() : super('');
}
