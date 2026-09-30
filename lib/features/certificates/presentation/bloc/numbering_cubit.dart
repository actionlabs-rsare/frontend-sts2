import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/formatters.dart';
import '../../domain/entities/certificate.dart';
import '../../domain/usecases/numbering_use_cases.dart';
import '../../domain/usecases/reference_use_cases.dart';
import 'numbering_state.dart';

/// SL-002 Settings › Stock certificate configuration. One row per share class and sequence;
/// the replacement sequence is separate (TR-004).
class NumberingCubit extends Cubit<NumberingState> {
  NumberingCubit(
    this._getCompanies,
    this._getShareClasses,
    this._getNumbering,
    this._setNumbering, {
    String initialCompanyCode = 'CO-001',
  }) : super(NumberingState(companyCode: initialCompanyCode)) {
    _init();
  }

  final GetCertificateCompaniesUseCase _getCompanies;
  final GetShareClassesForCompanyUseCase _getShareClasses;
  final GetNumberingUseCase _getNumbering;
  final SetNumberingUseCase _setNumbering;

  Future<void> _init() async {
    emit(state.copyWith(status: NumberingStatus.loading));
    try {
      final companies = await _getCompanies();
      await _loadRows(companies: companies);
    } catch (e) {
      emit(state.copyWith(status: NumberingStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> selectCompany(String companyCode) async {
    emit(state.copyWith(status: NumberingStatus.loading, companyCode: companyCode, successMessage: null));
    await _loadRows(companies: state.companies);
  }

  Future<void> reload({String? success}) async {
    emit(state.copyWith(status: NumberingStatus.loading, successMessage: success));
    await _loadRows(companies: state.companies);
  }

  Future<void> _loadRows({required Map<String, String> companies}) async {
    try {
      final companyCode = state.companyCode ?? companies.keys.first;
      final classes = await _getShareClasses(companyCode);
      final configs = await Future.wait(classes.map((c) => _getNumbering(c.id)));
      final rows = [
        for (var i = 0; i < classes.length; i++) ClassNumbering(classes[i], configs[i]),
      ];
      emit(state.copyWith(
        status: NumberingStatus.success,
        companies: companies,
        companyCode: companyCode,
        rows: rows,
      ));
    } catch (e) {
      emit(state.copyWith(status: NumberingStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<NumberingConfig?> save(
    ShareClassRef shareClass, {
    String? originalStart,
    String? replacementStart,
    NumberingMode? mode,
  }) async {
    try {
      final saved = await _setNumbering(shareClass.id,
          originalStart: originalStart, replacementStart: replacementStart, mode: mode);
      await reload(
        success: 'Numbering for ${shareClass.stockType} saved at ${formatTimeOfDay(DateTime.now())}. '
            'Next original ${saved.nextOriginal}, next replacement ${saved.nextReplacement}.',
      );
      return saved;
    } catch (_) {
      return null;
    }
  }
}
