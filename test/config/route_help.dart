import 'package:flutter/material.dart';
import 'package:mobile_app/src/screens/forgot_password_screen.dart';
import 'package:mobile_app/src/screens/login_screen.dart';
import 'package:mobile_app/src/screens/onboarding_screen.dart';
import 'package:mobile_app/src/screens/sign_up_screen.dart';

const String onboardingRoute = '/';
const String loginRoute = '/login';
const String signUpRoute = '/sign-up';
const String forgotPasswordRoute = '/forgot-password';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboardingRoute:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(),
                ));
    }
  }
}
