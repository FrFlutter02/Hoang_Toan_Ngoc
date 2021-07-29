import '../constants/constants.dart';

class Validators {
  static final RegExp _emailRegExp = RegExp(
    AppConstants.emailValidatorCode,
  );
  static final RegExp _passwordRegExp = RegExp(
    AppConstants.passWordValidatorCode,
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
