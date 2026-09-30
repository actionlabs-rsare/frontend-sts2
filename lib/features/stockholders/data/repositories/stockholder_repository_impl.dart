import '../../domain/entities/stockholder.dart';
import '../../domain/repositories/stockholder_repository.dart';
import '../datasources/stockholder_remote_data_source.dart';
import '../models/stockholder_model.dart';

class StockholderRepositoryImpl implements StockholderRepository {
  const StockholderRepositoryImpl(this._remote);

  final StockholderRemoteDataSource _remote;

  @override
  Future<List<Stockholder>> list({String? q}) async {
    final models = await _remote.list(q: q);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Stockholder> create(StockholderDraft draft) async {
    final model = await _remote.create(StockholderRequestModel.fromDomain(draft));
    return model.toEntity();
  }

  @override
  Future<Stockholder> update(String code, StockholderDraft draft) async {
    final model = await _remote.update(code, StockholderRequestModel.fromDomain(draft));
    return model.toEntity();
  }

  @override
  Future<Stockholder> deactivate(Stockholder stockholder) {
    return update(stockholder.stockholderCode, StockholderDraft.from(stockholder, active: false));
  }
}
