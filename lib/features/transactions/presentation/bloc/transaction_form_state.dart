import 'package:equatable/equatable.dart';

enum TransactionFormStatus { idle, submitting, success, failure }

class TransactionFormState extends Equatable {
  const TransactionFormState({this.status = TransactionFormStatus.idle, this.errorMessage});

  final TransactionFormStatus status;
  final String? errorMessage;

  bool get isSubmitting => status == TransactionFormStatus.submitting;

  TransactionFormState copyWith({TransactionFormStatus? status, String? errorMessage}) =>
      TransactionFormState(status: status ?? this.status, errorMessage: errorMessage);

  @override
  List<Object?> get props => [status, errorMessage];
}
