import 'package:equatable/equatable.dart';

import '../../domain/entities/transaction.dart';

enum TransactionListStatus { initial, loading, success, failure }

class TransactionListState extends Equatable {
  const TransactionListState({
    this.status = TransactionListStatus.initial,
    this.transactions = const [],
    this.errorMessage,
  });

  final TransactionListStatus status;
  final List<Transaction> transactions;
  final String? errorMessage;

  TransactionListState copyWith({
    TransactionListStatus? status,
    List<Transaction>? transactions,
    String? errorMessage,
  }) {
    return TransactionListState(
      status: status ?? this.status,
      transactions: transactions ?? this.transactions,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, transactions, errorMessage];
}
