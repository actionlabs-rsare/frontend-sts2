import '../entities/share_class.dart';
import '../repositories/share_class_repository.dart';

/// Creates a new share class, or updates one when [existingId] is given.
class SaveShareClassUseCase {
  const SaveShareClassUseCase(this._repository);

  final ShareClassRepository _repository;

  Future<ShareClass> call(String companyCode, ShareClassDraft draft, {String? existingId}) {
    return existingId == null
        ? _repository.create(companyCode, draft)
        : _repository.update(companyCode, existingId, draft);
  }
}
