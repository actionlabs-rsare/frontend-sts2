import 'dart:typed_data';

import '../../domain/entities/transaction.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_remote_data_source.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  const TransactionRepositoryImpl(this._remote);

  final TransactionRemoteDataSource _remote;

  @override
  Future<List<Transaction>> list({String? companyCode, String? status}) async {
    final models = await _remote.list(companyCode: companyCode, status: status);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Transaction> get(String id) async => (await _remote.get(id)).toEntity();

  @override
  Future<Transaction> createTransfer(TransferDraft draft) async {
    final model = await _remote.createTransfer(TransferRequestModel.fromDomain(draft));
    return model.toEntity();
  }

  @override
  Future<Transaction> submit(String id) async => (await _remote.submit(id)).toEntity();

  @override
  Future<Transaction> approve(String id, {String? reason}) async =>
      (await _remote.approve(id, reason: reason)).toEntity();

  @override
  Future<Transaction> reject(String id, {required String reason}) async =>
      (await _remote.reject(id, reason: reason)).toEntity();

  @override
  Future<Transaction> markPrinted(String id) async => (await _remote.markPrinted(id)).toEntity();

  @override
  Future<Uint8List> report({String? companyCode, String? status, String? dateFrom, String? dateTo}) {
    return _remote.report(companyCode: companyCode, status: status, dateFrom: dateFrom, dateTo: dateTo);
  }
}
