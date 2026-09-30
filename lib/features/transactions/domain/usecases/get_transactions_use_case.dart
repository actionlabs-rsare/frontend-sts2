import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

class GetTransactionsUseCase {
  const GetTransactionsUseCase(this._repository);

  final TransactionRepository _repository;

  Future<List<Transaction>> call({String? companyCode, String? status}) =>
      _repository.list(companyCode: companyCode, status: status);
}
