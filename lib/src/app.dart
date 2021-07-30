import 'package:flutter/material.dart';

import '../src/screens/onboarding_screen.dart';
import '../src/screens/login_screen.dart';
import '../src/screens/forgot_password_screen.dart';
import '../src/screens/sign_up_screen.dart';
import '../src/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => OnboardingScreen(),
        '/LoginScreen': (context) => Login_Screen(),
        '/ForgotPasswordScreen': (context) => ForgotPasswordScreen(),
        '/SignUpScreen': (context) => SignUpScreen(),
        '/Home': (context) => Home_Screen()
      },
    );
  }
}
