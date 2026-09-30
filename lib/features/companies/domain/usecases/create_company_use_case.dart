import '../entities/company.dart';
import '../repositories/company_repository.dart';

class CreateCompanyUseCase {
  const CreateCompanyUseCase(this._repository);

  final CompanyRepository _repository;

  Future<Company> call(CompanyDraft draft) => _repository.create(draft);
}
