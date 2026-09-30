import 'dart:typed_data';

import '../entities/transaction.dart';

abstract interface class TransactionRepository {
  Future<List<Transaction>> list({String? companyCode, String? status});
  Future<Transaction> get(String id);
  Future<Transaction> createTransfer(TransferDraft draft);
  Future<Transaction> submit(String id);
  Future<Transaction> approve(String id, {String? reason});
  Future<Transaction> reject(String id, {required String reason});
  Future<Transaction> markPrinted(String id);

  /// Fetches the transaction report as PDF bytes (IR-TXN). Server-side generated.
  Future<Uint8List> report({String? companyCode, String? status, String? dateFrom, String? dateTo});
}
