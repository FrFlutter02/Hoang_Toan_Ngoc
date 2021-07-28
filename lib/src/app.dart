import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/authentication_bloc/authentication_bloc.dart';
import 'blocs/authentication_bloc/authentication_event.dart';
import 'repository/user_repository.dart';
import 'blocs/simple_bloc_observer.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/login_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/sign_up_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Bloc.observer = SimpleBlocObserver();
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    final UserRepository userRepository = UserRepository();

    return BlocProvider(
        create: (context) => AuthenticationBloc(
              userRepository: userRepository,
            )..add(AuthenticationStarted()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => OnboardingScreen(),
            '/LoginScreen': (context) => LoginScreen(),
            '/ForgotPasswordScreen': (context) => ForgotPasswordScreen(),
            '/SignUpScreen': (context) => SignUpScreen(),
            // '/': (context) => SignUpScreen(),
          },
        ));
  }
}
