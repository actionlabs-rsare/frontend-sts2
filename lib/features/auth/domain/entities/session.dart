import 'package:equatable/equatable.dart';

/// The signed-in user's session: bearer token, role and permission set.
/// Replaced by real auth (PingOne, D6) behind the same surface later.
class Session extends Equatable {
  const Session({required this.token, required this.role, required this.permissions});

  final String token;
  final String role;
  final List<String> permissions;

  @override
  List<Object?> get props => [token, role, permissions];
}
