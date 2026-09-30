import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

class CreateTransferUseCase {
  const CreateTransferUseCase(this._repository);

  final TransactionRepository _repository;

  Future<Transaction> call(TransferDraft draft) => _repository.createTransfer(draft);
}
