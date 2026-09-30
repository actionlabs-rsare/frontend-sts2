import 'package:flutter_bloc/flutter_bloc.dart';

import 'dev_sign_in_state.dart';
import 'session_cubit.dart';

/// Drives the dev sign-in form (role picker + submit button). Delegates the actual sign-in to
/// [SessionCubit], which is the single source of truth for "am I signed in".
class DevSignInCubit extends Cubit<DevSignInState> {
  DevSignInCubit(this._sessionCubit) : super(const DevSignInState());

  final SessionCubit _sessionCubit;

  static const roles = [
    'Admin',
    'User',
    'FirstLevelApprover',
    'SecondLevelApprover',
    'TeamLeader',
  ];

  void selectRole(String role) => emit(state.copyWith(role: role));

  Future<void> submit() async {
    emit(state.copyWith(status: DevSignInStatus.submitting, errorMessage: null));
    try {
      await _sessionCubit.devSignIn(state.role);
      emit(state.copyWith(status: DevSignInStatus.idle));
    } catch (_) {
      emit(state.copyWith(
        status: DevSignInStatus.failure,
        errorMessage: 'Sign-in failed.',
      ));
    }
  }
}
