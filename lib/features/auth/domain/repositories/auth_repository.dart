import '../entities/session.dart';

abstract interface class AuthRepository {
  /// Dev-only sign-in: exchanges a role for a token (stands in for SSO).
  Future<Session> devSignIn(String role);
}
