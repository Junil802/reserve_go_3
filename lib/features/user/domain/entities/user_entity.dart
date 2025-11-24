import 'package:equatable/equatable.dart';

enum UserRole { client, admin, businessOwner }

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final UserRole role;
  final String? profileImageUrl;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    this.profileImageUrl,
  });

  @override
  List<Object?> get props => [id, email, name, role, profileImageUrl];
}
