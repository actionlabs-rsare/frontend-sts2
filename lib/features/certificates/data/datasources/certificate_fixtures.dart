import '../../domain/entities/certificate.dart';

/// WAVE 1 FIXTURES — SYNTHETIC DATA ONLY. Stands in for S1's share-class API and S2's
/// approved-transaction list until those are wired into the certificates screens.
class CertificateFixtures {
  const CertificateFixtures._();

  static const companies = <String, String>{
    'CO-001': 'Visayan Electric Company, Inc. (SAMPLE)',
    'CO-002': 'Hedcor, Inc. (SAMPLE)',
    'CO-003': 'Therma Power (SAMPLE)',
  };

  static const shareClasses = <ShareClassRef>[
    ShareClassRef(id: 'SC-CO-001-COM', companyCode: 'CO-001', stockType: 'Common'),
    ShareClassRef(id: 'SC-CO-001-RPF', companyCode: 'CO-001', stockType: 'Redeemable Preferred'),
    ShareClassRef(id: 'SC-CO-002-COM', companyCode: 'CO-002', stockType: 'Common'),
    ShareClassRef(id: 'SC-CO-003-COM', companyCode: 'CO-003', stockType: 'Common'),
  ];

  static const transactions = <PrintableTransactionRef>[
    PrintableTransactionRef(
        id: 'TRF-901',
        companyCode: 'CO-001',
        status: 'Approved',
        summary: 'Sale · Common · 3,000 to SH-0002, 2,000 balance to SH-0001',
        certificateCount: 2),
    PrintableTransactionRef(
        id: 'TRF-902',
        companyCode: 'CO-001',
        status: 'Approved',
        summary: 'Assignment · Redeemable Preferred · 500 to SH-0004',
        certificateCount: 1),
    PrintableTransactionRef(
        id: 'TRF-903',
        companyCode: 'CO-002',
        status: 'Approved',
        summary: 'Sale · Common · 1,000 to SH-0003',
        certificateCount: 1),
    PrintableTransactionRef(
        id: 'TRF-904',
        companyCode: 'CO-001',
        status: 'PendingFirstApproval',
        summary: 'Donation · Common · 250 to SH-0005',
        certificateCount: 1),
    PrintableTransactionRef(
        id: 'TRF-905',
        companyCode: 'CO-003',
        status: 'Approved',
        summary: 'Sale · Common · 12,500 to SH-0003, 7,500 to SH-0001',
        certificateCount: 2),
    PrintableTransactionRef(
        id: 'TRF-906',
        companyCode: 'CO-001',
        status: 'Approved',
        summary: 'Sale · Common · 100 to SH-0005 (individual)',
        certificateCount: 1),
  ];

  static List<ShareClassRef> shareClassesOf(String companyCode) =>
      shareClasses.where((s) => s.companyCode == companyCode).toList();
}
