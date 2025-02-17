class UserEntity {
  String id;
  String name;
  String email;
  String password;
  String profileImage;
  String role;

  UserEntity({
    required this.password,
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.role,
  });
}

