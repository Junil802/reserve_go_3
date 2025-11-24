import '../models/user_model.dart';
import '../../domain/entities/user_entity.dart';

abstract class UserDataSource {
  Future<UserModel> signUpUser({
    required String email,
    required String password,
    required String name,
    required UserRole role,
  });
  
  Future<UserModel> loginUser({
    required String email,
    required String password,
  });
  
  Future<UserModel> getUserProfile(String userId);
  
  Future<UserModel> updateUserProfile(UserModel user);
  
  Future<void> signOutUser();
}