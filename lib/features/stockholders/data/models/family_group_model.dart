import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/family_group.dart';

part 'family_group_model.freezed.dart';
part 'family_group_model.g.dart';

@freezed
abstract class FamilyGroupModel with _$FamilyGroupModel {
  const FamilyGroupModel._();

  const factory FamilyGroupModel({required String id, required String name}) = _FamilyGroupModel;

  factory FamilyGroupModel.fromJson(Map<String, dynamic> json) => _$FamilyGroupModelFromJson(json);

  FamilyGroup toEntity() => FamilyGroup(id: id, name: name);
}
