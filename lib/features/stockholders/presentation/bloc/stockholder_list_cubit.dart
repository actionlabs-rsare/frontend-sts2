import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/stockholder.dart';
import '../../domain/usecases/deactivate_stockholder_use_case.dart';
import '../../domain/usecases/get_family_groups_use_case.dart';
import '../../domain/usecases/get_stockholders_use_case.dart';
import 'stockholder_list_state.dart';

class StockholderListCubit extends Cubit<StockholderListState> {
  StockholderListCubit(this._getStockholders, this._getFamilyGroups, this._deactivateStockholder)
      : super(const StockholderListState()) {
    load();
    _loadFamilyGroups();
  }

  final GetStockholdersUseCase _getStockholders;
  final GetFamilyGroupsUseCase _getFamilyGroups;
  final DeactivateStockholderUseCase _deactivateStockholder;

  Future<void> _loadFamilyGroups() async {
    try {
      final groups = await _getFamilyGroups();
      emit(state.copyWith(familyGroups: groups));
    } catch (_) {
      // The form falls back to "— none —"; membership is optional, so this is not fatal.
    }
  }

  Future<void> load({String? q}) async {
    emit(state.copyWith(status: StockholderListStatus.loading, query: q ?? state.query));
    try {
      final stockholders = await _getStockholders(q: q ?? state.query);
      emit(state.copyWith(status: StockholderListStatus.success, stockholders: stockholders));
    } catch (e) {
      emit(state.copyWith(status: StockholderListStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<bool> deactivate(Stockholder stockholder) async {
    try {
      await _deactivateStockholder(stockholder);
      await load();
      return true;
    } catch (_) {
      return false;
    }
  }
}
