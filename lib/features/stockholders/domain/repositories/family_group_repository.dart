import '../entities/family_group.dart';
import '../entities/stockholder.dart';

abstract interface class FamilyGroupRepository {
  Future<List<FamilyGroup>> list();
  Future<FamilyGroup> create(String name);
  Future<List<Stockholder>> members(String id);
}
