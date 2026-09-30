import '../entities/certificate.dart';

/// Read-only reference data the certificate screens need from other units (companies, share
/// classes, printable transactions). Backed by fixtures until Wave 2 wires the real S1/S2 APIs
/// — see [WAVE_1_FIXTURES] in the data layer.
abstract interface class CertificateReferenceRepository {
  Future<Map<String, String>> companies();
  Future<List<ShareClassRef>> shareClassesOf(String companyCode);
  Future<List<PrintableTransactionRef>> printableTransactions();
}
