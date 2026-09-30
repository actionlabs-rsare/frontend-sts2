import '../entities/stockholder.dart';

/// There is no delete call and there must not be one (OI-19): retiring a stockholder is an
/// update with `active: false`, which the server audits.
abstract interface class StockholderRepository {
  Future<List<Stockholder>> list({String? q});
  Future<Stockholder> create(StockholderDraft draft);
  Future<Stockholder> update(String code, StockholderDraft draft);
  Future<Stockholder> deactivate(Stockholder stockholder);
}
