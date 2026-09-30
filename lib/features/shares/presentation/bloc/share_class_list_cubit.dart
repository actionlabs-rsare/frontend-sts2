import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../companies/domain/usecases/get_companies_use_case.dart';
import '../../domain/usecases/get_share_classes_use_case.dart';
import 'share_class_list_state.dart';

/// Lists share classes for a chosen company. Companies come from the real Companies
/// repository (fixes CR-6 — the previous version hardcoded 'CO-001'..'CO-003').
class ShareClassListCubit extends Cubit<ShareClassListState> {
  ShareClassListCubit(this._getCompanies, this._getShareClasses) : super(const ShareClassListState()) {
    _init();
  }

  final GetCompaniesUseCase _getCompanies;
  final GetShareClassesUseCase _getShareClasses;

  Future<void> _init() async {
    emit(state.copyWith(status: ShareClassListStatus.loading));
    try {
      final companies = await _getCompanies();
      if (companies.isEmpty) {
        emit(state.copyWith(status: ShareClassListStatus.success, companies: companies, shareClasses: const []));
        return;
      }
      final companyCode = companies.first.companyCode;
      final shareClasses = await _getShareClasses(companyCode);
      emit(state.copyWith(
        status: ShareClassListStatus.success,
        companies: companies,
        companyCode: companyCode,
        shareClasses: shareClasses,
      ));
    } catch (e) {
      emit(state.copyWith(status: ShareClassListStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> selectCompany(String companyCode) async {
    emit(state.copyWith(status: ShareClassListStatus.loading, companyCode: companyCode));
    await reload();
  }

  Future<void> reload() async {
    final companyCode = state.companyCode;
    if (companyCode == null) return;
    emit(state.copyWith(status: ShareClassListStatus.loading));
    try {
      final shareClasses = await _getShareClasses(companyCode);
      emit(state.copyWith(status: ShareClassListStatus.success, shareClasses: shareClasses));
    } catch (e) {
      emit(state.copyWith(status: ShareClassListStatus.failure, errorMessage: e.toString()));
    }
  }
}
