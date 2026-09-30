import '../../domain/entities/certificate.dart';
import '../../domain/repositories/certificate_reference_repository.dart';
import '../datasources/certificate_fixtures.dart';

/// Backed by Wave-1 fixtures. Swap the body of each method for real S1/S2 repository calls
/// once those are available — the interface will not need to change.
class CertificateReferenceRepositoryImpl implements CertificateReferenceRepository {
  const CertificateReferenceRepositoryImpl();

  @override
  Future<Map<String, String>> companies() async => CertificateFixtures.companies;

  @override
  Future<List<ShareClassRef>> shareClassesOf(String companyCode) async =>
      CertificateFixtures.shareClassesOf(companyCode);

  @override
  Future<List<PrintableTransactionRef>> printableTransactions() async => CertificateFixtures.transactions;
}
