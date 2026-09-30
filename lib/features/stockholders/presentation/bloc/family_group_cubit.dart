import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/family_group.dart';
import '../../domain/usecases/create_family_group_use_case.dart';
import '../../domain/usecases/get_family_group_members_use_case.dart';
import '../../domain/usecases/get_family_groups_use_case.dart';
import 'family_group_state.dart';

class FamilyGroupCubit extends Cubit<FamilyGroupPageState> {
  FamilyGroupCubit(this._getFamilyGroups, this._getMembers, this._createFamilyGroup)
      : super(const FamilyGroupPageState()) {
    load();
  }

  final GetFamilyGroupsUseCase _getFamilyGroups;
  final GetFamilyGroupMembersUseCase _getMembers;
  final CreateFamilyGroupUseCase _createFamilyGroup;

  Future<void> load() async {
    emit(state.copyWith(status: FamilyGroupListStatus.loading));
    try {
      final groups = await _getFamilyGroups();
      emit(state.copyWith(status: FamilyGroupListStatus.success, groups: groups));
    } catch (e) {
      emit(state.copyWith(status: FamilyGroupListStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> select(FamilyGroup group) async {
    emit(state.copyWith(selected: group, membersStatus: FamilyGroupMembersStatus.loading));
    try {
      final members = await _getMembers(group.id);
      emit(state.copyWith(membersStatus: FamilyGroupMembersStatus.success, members: members));
    } catch (_) {
      emit(state.copyWith(membersStatus: FamilyGroupMembersStatus.failure));
    }
  }

  Future<FamilyGroup?> addGroup(String name) async {
    try {
      final created = await _createFamilyGroup(name);
      await load();
      return created;
    } catch (_) {
      return null;
    }
  }
}
