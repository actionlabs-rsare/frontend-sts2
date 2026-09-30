import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/company.dart';
import '../../domain/usecases/create_company_use_case.dart';
import 'company_form_state.dart';

class CompanyFormCubit extends Cubit<CompanyFormState> {
  CompanyFormCubit(this._createCompany) : super(const CompanyFormState());

  final CreateCompanyUseCase _createCompany;

  Future<void> submit(CompanyDraft draft) async {
    emit(state.copyWith(status: CompanyFormStatus.submitting, errorMessage: null));
    try {
      await _createCompany(draft);
      emit(state.copyWith(status: CompanyFormStatus.success));
    } catch (_) {
      emit(state.copyWith(
        status: CompanyFormStatus.failure,
        errorMessage: 'Could not create company. Check your permissions and inputs.',
      ));
    }
  }
}
