import 'package:flutter/material.dart';

import '../src/screens/onboarding_page.dart';
import '../src/screens/login_page.dart';
import '../src/screens/forgot_password_page.dart';
import '../src/screens/signup_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => OnboardingPage(),
        '/LoginPage': (context) => LoginPage(),
        '/ForgotPasswordPage': (context) => ForgotPasswordPage(),
        '/SignUpPage': (context) => SignUpPage(),
      },
    );
  }
}
