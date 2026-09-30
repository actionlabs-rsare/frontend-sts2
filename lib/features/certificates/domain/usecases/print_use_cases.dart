import 'dart:typed_data';

import '../entities/certificate.dart';
import '../repositories/certificate_repository.dart';

class PrintCertificatesUseCase {
  const PrintCertificatesUseCase(this._repository);
  final CertificateRepository _repository;

  Future<List<Certificate>> call(
    String transactionId,
    PrintMode mode, {
    String? manualNumber,
    bool teamLeaderApproval = false,
  }) {
    return _repository.print(transactionId, mode,
        manualNumber: manualNumber, teamLeaderApproval: teamLeaderApproval);
  }
}

class ListCertificatesForTransactionUseCase {
  const ListCertificatesForTransactionUseCase(this._repository);
  final CertificateRepository _repository;
  Future<List<Certificate>> call(String transactionId) => _repository.listForTransaction(transactionId);
}

class DownloadCertificateDocumentUseCase {
  const DownloadCertificateDocumentUseCase(this._repository);
  final CertificateRepository _repository;
  Future<Uint8List> call(String transactionId, {PrintMode? mode}) =>
      _repository.downloadDocument(transactionId, mode: mode);
}
