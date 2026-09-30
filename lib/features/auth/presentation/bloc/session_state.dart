import 'package:equatable/equatable.dart';

import '../../domain/entities/session.dart';

/// Holds the current sign-in session, or none. Read via [SessionCubit.state].
class SessionState extends Equatable {
  const SessionState({this.session});

  const SessionState.signedOut() : session = null;

  final Session? session;

  bool get isSignedIn => session != null;
  String? get token => session?.token;
  String? get role => session?.role;
  List<String> get permissions => session?.permissions ?? const [];

  @override
  List<Object?> get props => [session];
}
