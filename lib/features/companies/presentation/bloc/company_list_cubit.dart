import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_companies_use_case.dart';
import 'company_list_state.dart';

class CompanyListCubit extends Cubit<CompanyListState> {
  CompanyListCubit(this._getCompanies) : super(const CompanyListState()) {
    load();
  }

  final GetCompaniesUseCase _getCompanies;

  Future<void> load({String? q}) async {
    emit(state.copyWith(status: CompanyListStatus.loading));
    try {
      final companies = await _getCompanies(q: q);
      emit(state.copyWith(status: CompanyListStatus.success, companies: companies));
    } catch (e) {
      emit(state.copyWith(status: CompanyListStatus.failure, errorMessage: e.toString()));
    }
  }
}
