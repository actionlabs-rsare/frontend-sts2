import '../entities/share_class.dart';
import '../repositories/share_class_repository.dart';

class GetShareClassesUseCase {
  const GetShareClassesUseCase(this._repository);

  final ShareClassRepository _repository;

  Future<List<ShareClass>> call(String companyCode) => _repository.list(companyCode);
}
