import 'package:flutter/material.dart';

import '../src/screens/onboarding_page.dart';
import '../src/screens/forgot_password_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => OnboardingPage(),
        '/ForgotPasswordPage': (context) => ForgotPasswordPage(),
        // '/ForgotPassword': (context) => ForgotPasswordPage(),
      },
    );
  }
}
