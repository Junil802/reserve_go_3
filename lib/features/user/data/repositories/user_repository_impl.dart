import 'package:dartz/dartz.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_data_source.dart';
import '../failures/auth_failure.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, UserEntity>> signUpUser({
    required String email,
    required String password,
    required String name,
    required UserRole role,
  }) async {
    try {
      final result = await _dataSource.signUpUser(
        email: email,
        password: password,
        name: name,
        role: role,
      );
      return Right(result);
    } catch (e) {
      return Left(AuthFailure('Failed to sign up: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _dataSource.loginUser(
        email: email,
        password: password,
      );
      return Right(result);
    } catch (e) {
      return Left(AuthFailure('Failed to login: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserProfile(String userId) async {
    try {
      final result = await _dataSource.getUserProfile(userId);
      return Right(result);
    } catch (e) {
      return Left(AuthFailure('Failed to get user profile: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUserProfile(UserEntity user) async {
    try {
      final result = await _dataSource.updateUserProfile(user as dynamic);
      return Right(result);
    } catch (e) {
      return Left(AuthFailure('Failed to update user profile: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> signOutUser() async {
    try {
      await _dataSource.signOutUser();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure('Failed to sign out: ${e.toString()}'));
    }
  }
}