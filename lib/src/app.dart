import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../src/blocs/login_blocs/login_blocs.dart';
import '../src/blocs/login_blocs/login_event.dart';
import '../src/blocs/authentication_blocs/authentication_blocs.dart';
import '../src/blocs/authentication_blocs/authentication_event.dart';
import '../src/blocs/authentication_blocs/authentication_state.dart';
import '../src/blocs/bloc_observer.dart';
import '../src/repositories/user_repository.dart';
import '../src/screens/home_screen.dart';

import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/signup_screen.dart';

class App extends StatelessWidget {
  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthenticationBloc(
                    userRepository: userRepository,
                  )..add(AuthenticationStarted())),
          BlocProvider<LoginBloc>(
              create: (context) => LoginBloc()..add(LoginFetched()))
        ],
        child: MaterialApp(initialRoute: '/LoginScreen', routes: {
          '/': (context) => Onboarding_Screen(),
          '/LoginScreen': (context) => Login_Screen(),
          '/ForgotPasswordScreen': (context) => ForgotPasswordScreen(),
          '/SignUpScreen': (context) => SignUpScreen(),
          '/Home': (context) => Home_Screen()
        }));
  }
}
