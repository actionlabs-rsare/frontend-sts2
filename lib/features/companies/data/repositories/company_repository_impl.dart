import '../../domain/entities/company.dart';
import '../../domain/repositories/company_repository.dart';
import '../datasources/company_remote_data_source.dart';
import '../models/company_model.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  const CompanyRepositoryImpl(this._remote);

  final CompanyRemoteDataSource _remote;

  @override
  Future<List<Company>> list({String? q}) async {
    final models = await _remote.list(q: q);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Company> create(CompanyDraft draft) async {
    final model = await _remote.create(CreateCompanyRequestModel.fromDomain(draft));
    return model.toEntity();
  }
}
