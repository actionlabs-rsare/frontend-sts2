import '../entities/stockholder.dart';
import '../repositories/stockholder_repository.dart';

class GetStockholdersUseCase {
  const GetStockholdersUseCase(this._repository);

  final StockholderRepository _repository;

  Future<List<Stockholder>> call({String? q}) => _repository.list(q: q);
}
