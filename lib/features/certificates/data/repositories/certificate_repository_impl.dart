import 'dart:typed_data';

import '../../domain/entities/certificate.dart';
import '../../domain/repositories/certificate_repository.dart';
import '../datasources/certificate_remote_data_source.dart';

class CertificateRepositoryImpl implements CertificateRepository {
  const CertificateRepositoryImpl(this._remote);

  final CertificateRemoteDataSource _remote;

  @override
  Future<NumberingConfig> getNumbering(String shareClassId) async =>
      (await _remote.getNumbering(shareClassId)).toEntity();

  @override
  Future<NumberingConfig> setNumbering(
    String shareClassId, {
    String? originalStart,
    String? replacementStart,
    NumberingMode? mode,
  }) async {
    final model = await _remote.setNumbering(shareClassId,
        originalStart: originalStart, replacementStart: replacementStart, mode: mode);
    return model.toEntity();
  }

  @override
  Future<List<Certificate>> print(
    String transactionId,
    PrintMode mode, {
    String? manualNumber,
    bool teamLeaderApproval = false,
  }) async {
    final models = await _remote.print(transactionId, mode,
        manualNumber: manualNumber, teamLeaderApproval: teamLeaderApproval);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Certificate>> listForTransaction(String transactionId) async {
    final models = await _remote.listForTransaction(transactionId);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Uint8List> downloadDocument(String transactionId, {PrintMode? mode}) =>
      _remote.downloadDocument(transactionId, mode: mode);
}
