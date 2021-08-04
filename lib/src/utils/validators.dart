import '../constants/constant_text.dart';

class Validators {
  static final RegExp _emailRegExp = RegExp(
    AppUtils.emailValidatorCode,
  );
  static final RegExp _passwordRegExp = RegExp(
    AppUtils.passWordValidatorCode,
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
