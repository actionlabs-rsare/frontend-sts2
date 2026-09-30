import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/session.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

/// Wire model for `POST /auth/dev-login` (dev-only sign-in stands in for SSO).
@freezed
abstract class SessionModel with _$SessionModel {
  const SessionModel._();

  const factory SessionModel({
    required String token,
    required String role,
    required List<String> permissions,
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);

  Session toEntity() => Session(token: token, role: role, permissions: permissions);
}
