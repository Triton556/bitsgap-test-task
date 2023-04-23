class User {
  final String email;
  final String username;
  final String password;

  const User(
      {required this.email, required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        email: json['email'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'password': password,
    };
  }
}
