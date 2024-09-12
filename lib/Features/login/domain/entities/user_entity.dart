class UserEntity {
  final String username;
  final String email;
  final String password;
  String? carType;

  UserEntity({
    this.carType,
    required this.username,
    required this.email,
    required this.password,
  });
}
