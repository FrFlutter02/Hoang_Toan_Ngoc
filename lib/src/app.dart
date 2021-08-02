import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suorce_review/src/blocs/reset_password_blocs/reset_password_bloc.dart';
import 'package:suorce_review/src/repositories/user_repository.dart';

import '../src/screens/forgot_password_screen.dart';
import '../src/screens/home_screen.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: ResetPasswordBloc(userRepository: userRepository),
          child: ForgotPasswordScreen(userRepository: userRepository),
        )
      ],
      child: MaterialApp(
        routes: {
          '/': (context) =>
              ForgotPasswordScreen(userRepository: userRepository),
          '/Home': (context) => HomeScreen()
        },
      ),
    );
  }
}
