import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/authentication_bloc/authentication_bloc.dart';
import 'blocs/authentication_bloc/authentication_event.dart';
import 'screens/home_screen.dart';
import 'blocs/sign_up_bloc/sign_up_bloc.dart';
import 'repository/user_repository.dart';
import 'screens/sign_up_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Bloc.observer = SimpleBlocObserver();

    final UserRepository userRepository = UserRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthenticationBloc(
                  userRepository: userRepository,
                )..add(AuthenticationStarted())),
        BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(userRepository: userRepository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          // '/': (context) => OnboardingScreen(),
          // '/LoginScreen': (context) => LoginScreen(),
          // '/ForgotPasswordScreen': (context) => ForgotPasswordScreen(),
          // '/SignUpScreen': (context) => SignUpScreen(),
          '/': (context) => SignUpScreen(),
          '/Home': (context) => Home_Screen()
        },
      ),
    );
  }
}
