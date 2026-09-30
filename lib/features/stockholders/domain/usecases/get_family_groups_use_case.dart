import '../entities/family_group.dart';
import '../repositories/family_group_repository.dart';

class GetFamilyGroupsUseCase {
  const GetFamilyGroupsUseCase(this._repository);

  final FamilyGroupRepository _repository;

  Future<List<FamilyGroup>> call() => _repository.list();
}
