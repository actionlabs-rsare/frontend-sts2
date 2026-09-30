import 'dart:typed_data';

import '../repositories/transaction_repository.dart';

class GetTransactionReportUseCase {
  const GetTransactionReportUseCase(this._repository);

  final TransactionRepository _repository;

  Future<Uint8List> call({String? companyCode, String? status, String? dateFrom, String? dateTo}) {
    return _repository.report(companyCode: companyCode, status: status, dateFrom: dateFrom, dateTo: dateTo);
  }
}
