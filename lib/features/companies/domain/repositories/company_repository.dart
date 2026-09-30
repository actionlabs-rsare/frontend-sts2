import '../entities/company.dart';

abstract interface class CompanyRepository {
  Future<List<Company>> list({String? q});
  Future<Company> create(CompanyDraft draft);
}
