import '../entities/stockholder.dart';
import '../repositories/family_group_repository.dart';

class GetFamilyGroupMembersUseCase {
  const GetFamilyGroupMembersUseCase(this._repository);

  final FamilyGroupRepository _repository;

  Future<List<Stockholder>> call(String groupId) => _repository.members(groupId);
}
