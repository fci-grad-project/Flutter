import 'package:graduation_project/features/auth/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.password,
    required super.id,
    required super.name,
    required super.email,
    required super.profileImage,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      password: json['password'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileImage: json['profileImage'],
      role: json['role'],
    );
  }
}
