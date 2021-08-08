import 'package:flutter/material.dart';

import '../../lib/src/screens/forgot_password_screen.dart';
import '../../lib/src/screens/home_screen.dart';

const String forgotPasswordRoute = '/';
const String homeRoute = '/home';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
