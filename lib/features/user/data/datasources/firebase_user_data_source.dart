import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../../domain/entities/user_entity.dart';
import 'user_data_source.dart';

class FirebaseUserDataSource implements UserDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  
  FirebaseUserDataSource({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firestore;

  @override
  Future<UserModel> signUpUser({
    required String email,
    required String password,
    required String name,
    required UserRole role,
  }) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user!;
    final userModel = UserModel(
      id: user.uid,
      email: email,
      name: name,
      role: role,
      profileImageUrl: null,
    );

    await _firestore.collection('users').doc(user.uid).set(userModel.toJson());
    return userModel;
  }

  @override
  Future<UserModel> loginUser({
    required String email,
    required String password,
  }) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user!;
    final userData = await _firestore.collection('users').doc(user.uid).get();
    
    return UserModel.fromJson(userData.data()!);
  }

  @override
  Future<UserModel> getUserProfile(String userId) async {
    final userData = await _firestore.collection('users').doc(userId).get();
    return UserModel.fromJson(userData.data()!);
  }

  @override
  Future<UserModel> updateUserProfile(UserModel user) async {
    await _firestore.collection('users').doc(user.id).update(user.toJson());
    return user;
  }

  @override
  Future<void> signOutUser() async {
    await _firebaseAuth.signOut();
  }
}