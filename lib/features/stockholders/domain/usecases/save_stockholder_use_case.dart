import '../entities/stockholder.dart';
import '../repositories/stockholder_repository.dart';

class SaveStockholderUseCase {
  const SaveStockholderUseCase(this._repository);

  final StockholderRepository _repository;

  Future<Stockholder> call(StockholderDraft draft, {String? existingCode}) {
    return existingCode == null ? _repository.create(draft) : _repository.update(existingCode, draft);
  }
}
