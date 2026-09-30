import 'package:equatable/equatable.dart';

import '../../domain/entities/stockholder.dart';

enum StockholderFormStatus { idle, submitting, success, failure }

class StockholderFormState extends Equatable {
  const StockholderFormState({this.status = StockholderFormStatus.idle, this.errorMessage, this.saved});

  final StockholderFormStatus status;
  final String? errorMessage;
  final Stockholder? saved;

  bool get isSubmitting => status == StockholderFormStatus.submitting;

  StockholderFormState copyWith({
    StockholderFormStatus? status,
    String? errorMessage,
    Stockholder? saved,
  }) {
    return StockholderFormState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      saved: saved,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, saved];
}
