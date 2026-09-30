import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/app_exception.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/usecases/create_transfer_use_case.dart';
import 'transaction_form_state.dart';

class TransactionFormCubit extends Cubit<TransactionFormState> {
  TransactionFormCubit(this._createTransfer) : super(const TransactionFormState());

  final CreateTransferUseCase _createTransfer;

  Future<void> submit(TransferDraft draft) async {
    emit(state.copyWith(status: TransactionFormStatus.submitting, errorMessage: null));
    try {
      await _createTransfer(draft);
      emit(state.copyWith(status: TransactionFormStatus.success));
    } on AppException catch (e) {
      emit(state.copyWith(status: TransactionFormStatus.failure, errorMessage: e.message));
    } catch (_) {
      emit(state.copyWith(
        status: TransactionFormStatus.failure,
        errorMessage: 'Could not create the transfer. Check your permissions and inputs.',
      ));
    }
  }
}
