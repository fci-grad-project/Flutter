import 'package:graduation_project/features/auth/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.password,
    required super.name,
    required super.email,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      password: json['password'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
    );
  }
}
