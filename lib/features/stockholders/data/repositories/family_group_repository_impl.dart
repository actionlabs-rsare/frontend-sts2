import '../../domain/entities/family_group.dart';
import '../../domain/entities/stockholder.dart';
import '../../domain/repositories/family_group_repository.dart';
import '../datasources/family_group_remote_data_source.dart';

class FamilyGroupRepositoryImpl implements FamilyGroupRepository {
  const FamilyGroupRepositoryImpl(this._remote);

  final FamilyGroupRemoteDataSource _remote;

  @override
  Future<List<FamilyGroup>> list() async {
    final models = await _remote.list();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<FamilyGroup> create(String name) async {
    final model = await _remote.create(name);
    return model.toEntity();
  }

  @override
  Future<List<Stockholder>> members(String id) async {
    final models = await _remote.members(id);
    return models.map((m) => m.toEntity()).toList();
  }
}
