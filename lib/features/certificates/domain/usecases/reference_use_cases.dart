import '../entities/certificate.dart';
import '../repositories/certificate_reference_repository.dart';

class GetCertificateCompaniesUseCase {
  const GetCertificateCompaniesUseCase(this._repository);
  final CertificateReferenceRepository _repository;
  Future<Map<String, String>> call() => _repository.companies();
}

class GetShareClassesForCompanyUseCase {
  const GetShareClassesForCompanyUseCase(this._repository);
  final CertificateReferenceRepository _repository;
  Future<List<ShareClassRef>> call(String companyCode) => _repository.shareClassesOf(companyCode);
}

class GetPrintableTransactionsUseCase {
  const GetPrintableTransactionsUseCase(this._repository);
  final CertificateReferenceRepository _repository;
  Future<List<PrintableTransactionRef>> call() => _repository.printableTransactions();
}
