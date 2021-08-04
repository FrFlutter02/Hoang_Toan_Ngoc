import 'package:flutter/material.dart';

import '../src/screens/onboarding_screen.dart';
import '../src/screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => OnboardingScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
