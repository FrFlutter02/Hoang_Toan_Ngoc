import '../constants/constants_text.dart';

class Validators {
  static final RegExp _emailRegExp = RegExp(
    AppConstantsText.emailValidatorCode,
  );
  static final RegExp _passwordRegExp = RegExp(
    AppConstantsText.passWordValidatorCode,
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
