import 'package:equatable/equatable.dart';

import '../../domain/entities/family_group.dart';
import '../../domain/entities/stockholder.dart';

enum FamilyGroupListStatus { initial, loading, success, failure }
enum FamilyGroupMembersStatus { idle, loading, success, failure }

class FamilyGroupPageState extends Equatable {
  const FamilyGroupPageState({
    this.status = FamilyGroupListStatus.initial,
    this.groups = const [],
    this.errorMessage,
    this.selected,
    this.membersStatus = FamilyGroupMembersStatus.idle,
    this.members = const [],
  });

  final FamilyGroupListStatus status;
  final List<FamilyGroup> groups;
  final String? errorMessage;
  final FamilyGroup? selected;
  final FamilyGroupMembersStatus membersStatus;
  final List<Stockholder> members;

  FamilyGroupPageState copyWith({
    FamilyGroupListStatus? status,
    List<FamilyGroup>? groups,
    String? errorMessage,
    FamilyGroup? selected,
    FamilyGroupMembersStatus? membersStatus,
    List<Stockholder>? members,
  }) {
    return FamilyGroupPageState(
      status: status ?? this.status,
      groups: groups ?? this.groups,
      errorMessage: errorMessage,
      selected: selected ?? this.selected,
      membersStatus: membersStatus ?? this.membersStatus,
      members: members ?? this.members,
    );
  }

  @override
  List<Object?> get props => [status, groups, errorMessage, selected, membersStatus, members];
}
