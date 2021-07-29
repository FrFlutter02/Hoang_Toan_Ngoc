import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/sign_up_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();

    return MaterialApp(
      routes: {
        '/': (context) => OnboardingScreen(),
        '/LoginScreen': (context) => LoginScreen(),
        '/ForgotPasswordScreen': (context) => ForgotPasswordScreen(),
        '/SignUpScreen': (context) => SignUpScreen(),
      },
    );
  }
}
