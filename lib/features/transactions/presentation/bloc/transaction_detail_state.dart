import 'package:equatable/equatable.dart';

import '../../domain/entities/transaction.dart';

enum TransactionDetailStatus { loading, success, failure }

class TransactionDetailState extends Equatable {
  const TransactionDetailState({
    this.status = TransactionDetailStatus.loading,
    this.transaction,
    this.errorMessage,
    this.isActionRunning = false,
    this.changed = false,
  });

  final TransactionDetailStatus status;
  final Transaction? transaction;
  final String? errorMessage;
  final bool isActionRunning;
  final bool changed;

  TransactionDetailState copyWith({
    TransactionDetailStatus? status,
    Transaction? transaction,
    String? errorMessage,
    bool? isActionRunning,
    bool? changed,
  }) {
    return TransactionDetailState(
      status: status ?? this.status,
      transaction: transaction ?? this.transaction,
      errorMessage: errorMessage,
      isActionRunning: isActionRunning ?? this.isActionRunning,
      changed: changed ?? this.changed,
    );
  }

  @override
  List<Object?> get props => [status, transaction, errorMessage, isActionRunning, changed];
}
