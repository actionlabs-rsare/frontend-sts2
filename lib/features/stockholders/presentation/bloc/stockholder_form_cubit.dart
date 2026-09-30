import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/stockholder.dart';
import '../../domain/usecases/save_stockholder_use_case.dart';
import 'stockholder_form_state.dart';

class StockholderFormCubit extends Cubit<StockholderFormState> {
  StockholderFormCubit(this._saveStockholder) : super(const StockholderFormState());

  final SaveStockholderUseCase _saveStockholder;

  Future<void> submit(StockholderDraft draft, {String? existingCode}) async {
    emit(state.copyWith(status: StockholderFormStatus.submitting, errorMessage: null));
    try {
      final saved = await _saveStockholder(draft, existingCode: existingCode);
      emit(state.copyWith(status: StockholderFormStatus.success, saved: saved));
    } catch (_) {
      emit(state.copyWith(
        status: StockholderFormStatus.failure,
        errorMessage: existingCode == null
            ? 'Could not create the stockholder. Check the required fields and your permissions.'
            : 'Could not save this stockholder. Check the required fields, then try again.',
      ));
    }
  }
}
