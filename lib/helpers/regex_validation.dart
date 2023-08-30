
String? emailValidation(value) {
  const String emailRegex = r"^[a-z0-9.]+@[a-z0-9]+[.][a-z]+";
  RegExp regExp = RegExp(emailRegex);
  return regExp.hasMatch(value ?? '') ? null : 'Email inválido';
}
