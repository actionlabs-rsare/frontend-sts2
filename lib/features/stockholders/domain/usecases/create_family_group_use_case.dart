import '../entities/family_group.dart';
import '../repositories/family_group_repository.dart';

class CreateFamilyGroupUseCase {
  const CreateFamilyGroupUseCase(this._repository);

  final FamilyGroupRepository _repository;

  Future<FamilyGroup> call(String name) => _repository.create(name);
}
