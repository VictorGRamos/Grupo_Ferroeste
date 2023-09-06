class Login {
  String email = '';
  String password = '';

  Login({required this.email, required this.password});

  factory Login.fromJson(Map<String, dynamic> parsedJson) {
    return Login(
      email: parsedJson['email'],
      password: parsedJson['senha'],
    );
  }
}
