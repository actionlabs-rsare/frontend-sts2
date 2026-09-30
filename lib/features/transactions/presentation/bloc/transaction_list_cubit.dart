import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_transaction_report_use_case.dart';
import '../../domain/usecases/get_transactions_use_case.dart';
import 'transaction_list_state.dart';

class TransactionListCubit extends Cubit<TransactionListState> {
  TransactionListCubit(this._getTransactions, this._getReport) : super(const TransactionListState()) {
    load();
  }

  final GetTransactionsUseCase _getTransactions;
  final GetTransactionReportUseCase _getReport;

  Future<void> load() async {
    emit(state.copyWith(status: TransactionListStatus.loading));
    try {
      final transactions = await _getTransactions();
      emit(state.copyWith(status: TransactionListStatus.success, transactions: transactions));
    } catch (e) {
      emit(state.copyWith(status: TransactionListStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<Uint8List?> downloadReport() async {
    try {
      return await _getReport();
    } catch (_) {
      return null;
    }
  }
}
