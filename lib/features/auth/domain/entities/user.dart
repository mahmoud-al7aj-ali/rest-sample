class User {
  final String token;
  final int id;
  final String name;
  final String email;
  final String role;

  const User({
    required this.token,
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });
}
