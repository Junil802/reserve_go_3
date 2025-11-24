import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../failures/failure.dart';
import '../repositories/user_repository.dart';

class LoginUser {
  final UserRepository repository;

  LoginUser(this.repository);

  Future<Either<Failure, UserEntity>> call({required String email, required String password}) {
    return repository.loginUser(email: email, password: password);
  }
}
