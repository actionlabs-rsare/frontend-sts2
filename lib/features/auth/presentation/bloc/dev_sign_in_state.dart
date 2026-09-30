import 'package:equatable/equatable.dart';

enum DevSignInStatus { idle, submitting, failure }

class DevSignInState extends Equatable {
  const DevSignInState({this.status = DevSignInStatus.idle, this.role = 'Admin', this.errorMessage});

  final DevSignInStatus status;
  final String role;
  final String? errorMessage;

  bool get isSubmitting => status == DevSignInStatus.submitting;

  DevSignInState copyWith({DevSignInStatus? status, String? role, String? errorMessage}) {
    return DevSignInState(
      status: status ?? this.status,
      role: role ?? this.role,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, role, errorMessage];
}
