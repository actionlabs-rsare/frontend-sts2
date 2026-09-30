import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/app_exception.dart';
import '../../domain/usecases/get_transaction_use_case.dart';
import '../../domain/usecases/transaction_action_use_cases.dart';
import 'transaction_detail_state.dart';

/// Transaction detail + approval actions. Shows the computed transferor/transferee breakdown
/// (TR-003), the approval history and the actions available for the current status and role.
/// All actions are re-checked server-side.
class TransactionDetailCubit extends Cubit<TransactionDetailState> {
  TransactionDetailCubit(
    this._id,
    this._getTransaction,
    this._submitTransaction,
    this._approveTransaction,
    this._rejectTransaction,
    this._markPrinted,
  ) : super(const TransactionDetailState()) {
    load();
  }

  final String _id;
  final GetTransactionUseCase _getTransaction;
  final SubmitTransactionUseCase _submitTransaction;
  final ApproveTransactionUseCase _approveTransaction;
  final RejectTransactionUseCase _rejectTransaction;
  final MarkTransactionPrintedUseCase _markPrinted;

  Future<void> load() async {
    emit(state.copyWith(status: TransactionDetailStatus.loading));
    try {
      final transaction = await _getTransaction(_id);
      emit(state.copyWith(status: TransactionDetailStatus.success, transaction: transaction));
    } catch (e) {
      emit(state.copyWith(status: TransactionDetailStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<String?> submit() => _run(() => _submitTransaction(_id));

  Future<String?> approve({String? reason}) => _run(() => _approveTransaction(_id, reason: reason));

  Future<String?> reject({required String reason}) => _run(() => _rejectTransaction(_id, reason: reason));

  Future<String?> markPrinted() => _run(() => _markPrinted(_id));

  /// Runs an approval action; returns an error message on failure, or null on success.
  Future<String?> _run(Future Function() action) async {
    emit(state.copyWith(isActionRunning: true));
    try {
      await action();
      emit(state.copyWith(isActionRunning: false, changed: true));
      await load();
      return null;
    } on AppException catch (e) {
      emit(state.copyWith(isActionRunning: false));
      return _friendly(e);
    } catch (_) {
      emit(state.copyWith(isActionRunning: false));
      return 'Action failed. Please try again.';
    }
  }

  String _friendly(AppException e) {
    if (e.isForbidden) return 'Your role may not perform this action.';
    if (e.statusCode == 422) return 'That action is not allowed in the current state, or a reason is required.';
    return e.message;
  }
}
