import '../entities/stockholder.dart';
import '../repositories/stockholder_repository.dart';

class DeactivateStockholderUseCase {
  const DeactivateStockholderUseCase(this._repository);

  final StockholderRepository _repository;

  Future<Stockholder> call(Stockholder stockholder) => _repository.deactivate(stockholder);
}
