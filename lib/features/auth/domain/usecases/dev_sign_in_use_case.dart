import '../entities/session.dart';
import '../repositories/auth_repository.dart';

class DevSignInUseCase {
  const DevSignInUseCase(this._repository);

  final AuthRepository _repository;

  Future<Session> call(String role) => _repository.devSignIn(role);
}
