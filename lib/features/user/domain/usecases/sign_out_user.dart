import 'package:dartz/dartz.dart';
import '../failures/failure.dart';
import '../repositories/user_repository.dart';

class SignOutUser {
  final UserRepository repository;

  SignOutUser(this.repository);

  Future<Either<Failure, void>> call() {
    return repository.signOutUser();
  }
}
