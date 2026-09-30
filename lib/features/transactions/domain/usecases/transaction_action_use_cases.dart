import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

/// Approval-workflow actions (SL-004): submit → approve/reject → mark printed (posted).
/// Grouped in one file since each is a one-line delegation to the repository.
class SubmitTransactionUseCase {
  const SubmitTransactionUseCase(this._repository);
  final TransactionRepository _repository;
  Future<Transaction> call(String id) => _repository.submit(id);
}

class ApproveTransactionUseCase {
  const ApproveTransactionUseCase(this._repository);
  final TransactionRepository _repository;
  Future<Transaction> call(String id, {String? reason}) => _repository.approve(id, reason: reason);
}

class RejectTransactionUseCase {
  const RejectTransactionUseCase(this._repository);
  final TransactionRepository _repository;
  Future<Transaction> call(String id, {required String reason}) =>
      _repository.reject(id, reason: reason);
}

class MarkTransactionPrintedUseCase {
  const MarkTransactionPrintedUseCase(this._repository);
  final TransactionRepository _repository;
  Future<Transaction> call(String id) => _repository.markPrinted(id);
}
