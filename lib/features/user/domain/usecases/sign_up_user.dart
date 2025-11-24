import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../failures/failure.dart';
import '../repositories/user_repository.dart';

class SignUpUser {
  final UserRepository repository;

  SignUpUser(this.repository);

  Future<Either<Failure, UserEntity>> call({required String email, required String password, required String name, required UserRole role}) {
    return repository.signUpUser(email: email, password: password, name: name, role: role);
  }
}
