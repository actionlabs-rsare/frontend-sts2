import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/share_class.dart';
import '../../domain/usecases/save_share_class_use_case.dart';
import 'share_class_form_state.dart';

class ShareClassFormCubit extends Cubit<ShareClassFormState> {
  ShareClassFormCubit(this._saveShareClass) : super(const ShareClassFormState());

  final SaveShareClassUseCase _saveShareClass;

  Future<void> submit(String companyCode, ShareClassDraft draft, {String? existingId}) async {
    emit(state.copyWith(status: ShareClassFormStatus.submitting, errorMessage: null));
    try {
      final saved = await _saveShareClass(companyCode, draft, existingId: existingId);
      emit(state.copyWith(status: ShareClassFormStatus.success, saved: saved));
    } catch (_) {
      emit(state.copyWith(
        status: ShareClassFormStatus.failure,
        errorMessage:
            'Could not save the share class. Check that treasury ≤ issued ≤ subscribed ≤ authorized, '
            'and that this company does not already have that stock type.',
      ));
    }
  }
}
