import '../entities/certificate.dart';
import '../repositories/certificate_repository.dart';

class GetNumberingUseCase {
  const GetNumberingUseCase(this._repository);
  final CertificateRepository _repository;
  Future<NumberingConfig> call(String shareClassId) => _repository.getNumbering(shareClassId);
}

class SetNumberingUseCase {
  const SetNumberingUseCase(this._repository);
  final CertificateRepository _repository;

  Future<NumberingConfig> call(
    String shareClassId, {
    String? originalStart,
    String? replacementStart,
    NumberingMode? mode,
  }) {
    return _repository.setNumbering(shareClassId,
        originalStart: originalStart, replacementStart: replacementStart, mode: mode);
  }
}
