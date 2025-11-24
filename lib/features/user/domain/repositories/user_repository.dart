import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../failures/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> signUpUser({required String email, required String password, required String name, required UserRole role});
  Future<Either<Failure, UserEntity>> loginUser({required String email, required String password});
  Future<Either<Failure, UserEntity>> getUserProfile(String userId);
  Future<Either<Failure, UserEntity>> updateUserProfile(UserEntity user);
  Future<Either<Failure, void>> signOutUser();
}
