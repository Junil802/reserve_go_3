import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String id,
    required String email,
    required String name,
    required UserRole role,
    String? profileImageUrl,
  }) : super(
          id: id,
          email: email,
          name: name,
          role: role,
          profileImageUrl: profileImageUrl,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      role: UserRole.values.firstWhere(
        (role) => role.toString() == 'UserRole.${json['role']}',
      ),
      profileImageUrl: json['profileImageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'role': role.toString().split('.').last,
      'profileImageUrl': profileImageUrl,
    };
  }
}