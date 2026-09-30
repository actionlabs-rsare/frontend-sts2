import 'dart:typed_data';

import '../entities/certificate.dart';

abstract interface class CertificateRepository {
  Future<NumberingConfig> getNumbering(String shareClassId);

  /// SL-002: only the fields given are changed. Starting points only move forward.
  Future<NumberingConfig> setNumbering(
    String shareClassId, {
    String? originalStart,
    String? replacementStart,
    NumberingMode? mode,
  });

  /// TR-017/TR-018. A manual number needs Team Leader approval; the server checks the role.
  Future<List<Certificate>> print(
    String transactionId,
    PrintMode mode, {
    String? manualNumber,
    bool teamLeaderApproval = false,
  });

  Future<List<Certificate>> listForTransaction(String transactionId);

  /// The printable PDF for a transaction's certificates.
  Future<Uint8List> downloadDocument(String transactionId, {PrintMode? mode});
}
