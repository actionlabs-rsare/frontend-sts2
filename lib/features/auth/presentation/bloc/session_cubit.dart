import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/dev_sign_in_use_case.dart';
import 'session_state.dart';

/// App-wide session cubit. Registered as a lazy singleton in DI so both the router (for
/// redirect logic) and the dev sign-in screen share the same instance.
class SessionCubit extends Cubit<SessionState> {
  SessionCubit(this._devSignInUseCase) : super(const SessionState.signedOut());

  final DevSignInUseCase _devSignInUseCase;

  Future<void> devSignIn(String role) async {
    final session = await _devSignInUseCase(role);
    emit(SessionState(session: session));
  }

  void signOut() => emit(const SessionState.signedOut());
}
