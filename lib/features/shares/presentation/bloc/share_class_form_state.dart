import 'package:equatable/equatable.dart';

import '../../domain/entities/share_class.dart';

enum ShareClassFormStatus { idle, submitting, success, failure }

class ShareClassFormState extends Equatable {
  const ShareClassFormState({this.status = ShareClassFormStatus.idle, this.errorMessage, this.saved});

  final ShareClassFormStatus status;
  final String? errorMessage;
  final ShareClass? saved;

  bool get isSubmitting => status == ShareClassFormStatus.submitting;

  ShareClassFormState copyWith({
    ShareClassFormStatus? status,
    String? errorMessage,
    ShareClass? saved,
  }) {
    return ShareClassFormState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      saved: saved,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, saved];
}
