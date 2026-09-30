import 'package:equatable/equatable.dart';

/// Family group (MDM-002-FG, OI-15), mirroring #/schemas/FamilyGroup.
class FamilyGroup extends Equatable {
  const FamilyGroup({required this.id, required this.name});

  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
