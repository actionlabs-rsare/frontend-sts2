import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

class GetTransactionUseCase {
  const GetTransactionUseCase(this._repository);

  final TransactionRepository _repository;

  Future<Transaction> call(String id) => _repository.get(id);
}
