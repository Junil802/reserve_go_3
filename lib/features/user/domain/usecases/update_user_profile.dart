import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../failures/failure.dart';
import '../repositories/user_repository.dart';

class UpdateUserProfile {
  final UserRepository repository;

  UpdateUserProfile(this.repository);

  Future<Either<Failure, UserEntity>> call(UserEntity user) {
    return repository.updateUserProfile(user);
  }
}
