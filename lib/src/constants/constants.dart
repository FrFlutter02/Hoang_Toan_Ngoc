class AppForgotPasswordScreen {
  static const int iconTextColor = 0xFF363837;
  static const int emailTextColor = 0xFFA8A8A8;
  static const int lineInputBorderColor = 0xffCCCCCC;
  static const int buttonColor = 0xff30BE76;
  static const int emailAddressColor = 0xFF030F09;
  static const int resetPasswordColor = 0xFF030F09;
  static const int tutorialTextColor = 0xFF000000;
  static const int startFromScratchTextColor = 0xFF030F09;
}

class AppConstants {
  static const String textIcon = 'scratch';
  static const String resetPasswordText = 'Reset password';
  static const String tutorialText =
      "Enter the email associated with your account and we'll send an email with a link to reset your password.";
  static const String emailtext = 'Email address';
  static const String nameButton = 'Send';
  static const String startFromScratchText = 'Start from Scratch';
  static const String errorMessage = 'Error';
  static const String validateEmailText =
      "Email should have a valid email address form. ";
  static const String emailValidatorCode =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String passWordValidatorCode =
      r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{8,}$';
}

class AppImages {
  static const String backGroundImage = 'assets/images/background_image.png';
}

class AppIcons {
  static const String logoIcon = 'assets/icons/logo_icon.png';
}

class AppFonts {
  static const String fontAppRegular = "Nunito-Regular";
  static const String fontAppBold = "Nunito-Bold";
  static const String fontAppSemiBold = "Nunito-SemiBold";
}
