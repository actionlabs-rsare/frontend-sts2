import '../../domain/entities/share_class.dart';
import '../../domain/repositories/share_class_repository.dart';
import '../datasources/share_class_remote_data_source.dart';
import '../models/share_class_model.dart';

class ShareClassRepositoryImpl implements ShareClassRepository {
  const ShareClassRepositoryImpl(this._remote);

  final ShareClassRemoteDataSource _remote;

  @override
  Future<List<ShareClass>> list(String companyCode) async {
    final models = await _remote.list(companyCode);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<ShareClass> create(String companyCode, ShareClassDraft draft) async {
    final model = await _remote.create(companyCode, ShareClassRequestModel.fromDomain(draft));
    return model.toEntity();
  }

  @override
  Future<ShareClass> update(String companyCode, String id, ShareClassDraft draft) async {
    final model = await _remote.update(companyCode, id, ShareClassRequestModel.fromDomain(draft));
    return model.toEntity();
  }
}
