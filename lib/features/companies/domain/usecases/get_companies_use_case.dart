import '../entities/company.dart';
import '../repositories/company_repository.dart';

class GetCompaniesUseCase {
  const GetCompaniesUseCase(this._repository);

  final CompanyRepository _repository;

  Future<List<Company>> call({String? q}) => _repository.list(q: q);
}
