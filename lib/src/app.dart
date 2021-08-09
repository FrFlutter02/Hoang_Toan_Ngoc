import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../src/screens/forgot_password_screen.dart';
import '../src/screens/home_screen.dart';
import '../src/blocs/reset_password_blocs/reset_password_bloc.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ResetPasswordBloc(),
        )
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => ForgotPasswordScreen(),
          '/home': (context) => HomeScreen()
        },
      ),
    );
  }
}
