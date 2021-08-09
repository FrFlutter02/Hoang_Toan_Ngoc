import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../src/blocs/login_blocs/login_blocs.dart';
import '../src/blocs/login_blocs/login_event.dart';

import '../src/blocs/bloc_observer.dart';
import '../src/repositories/user_repository.dart';
import '../src/screens/home_screen.dart';

import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/signup_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
              create: (context) => LoginBloc()..add(LoginFetched()))
        ],
        child: MaterialApp(initialRoute: '/Login', routes: {
          '/': (context) => OnboardingScreen(),
          '/Login': (context) => LoginScreen(),
          '/ForgotPasswordScreen': (context) => ForgotPasswordScreen(),
          '/SignUpScreen': (context) => SignUpScreen(),
          '/Home': (context) => HomeScreen()
        }));
  }
}
