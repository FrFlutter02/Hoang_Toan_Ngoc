class SignUpText {
  static const String createAccountText = "Create Account";
  static const String titleMobileText = "Start \nfrom Scratch";
  static const String titleText = "Start from Scratch";
  static const String passwordText = "Password";
  static const String emailText = "Email";
  static const String fullNameText = "Full name";
  static const String forgotPassWordText = "Forgot password?";
  static const String createAccountToContinueText =
      "Create account to continue.";
  static const String loginHereText = "Login Here";
  static const String alreadyHaveAnAccountText = "Already have an account?";
  static const String errorEmailText = "Email is already";
  static const String exceptionErrorEmailText = 'email-already-in-use';
}

class AppConstantsText {
  static const String nameApp = "scratch";
  static const String validateNameText = "Please enter valid name ";
  static const String validateEmailText =
      "Email should have a valid email address form.";
  static const String validatePassWordText =
      "Password should have more than 8 characters, \nincluding number, lower and upper character, \nand uncharacter.";
  static const String emailValidatorCode =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String passWordValidatorCode =
      r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{8,}$';
  static const String obscuringCharacter = '⬤';
}

class AppImages {
  static const String imageSignUpPath = "assets/images/background_image.jpeg";
}

class AppIcons {
  static const String imageLogoPath = "assets/icons/logo_icon.png";
}

class AppFonts {
  static const String fontAppRegular = "Nunito-Regular";
  static const String fontAppBold = "Nunito-Bold";
  static const String fontAppSemiBold = "Nunito-SemiBold";
}
