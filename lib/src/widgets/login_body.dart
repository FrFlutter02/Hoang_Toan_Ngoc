import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/login_blocs/login_blocs.dart';
import '../blocs/login_blocs/login_event.dart';
import '../blocs/login_blocs/login_states.dart';
import '../screens/home_screen.dart';
import '../utils/validators.dart';
import '../repositories/user_repository.dart';
import '../constants/constants.dart';

class Login_Body extends StatefulWidget {
  final double Width;
  final double Height;
  Login_Body({required this.Width, required this.Height});
  @override
  LoginForm createState() => LoginForm(Width: Width, Height: Height);
}

class LoginForm extends State<Login_Body> {
  // This widget is the root of your application.
  final double Width;
  final double Height;

  LoginForm({required this.Width, required this.Height});
  final emailController = TextEditingController();
  final passWordController = TextEditingController();
  final UserRepository _userRepository = UserRepository();
  final Validators validators = Validators();
  String checkValidateEmail(String email) {
    bool isValidEmail = validators.isValidEmail(email);
    if (isValidEmail == true) {
      return "";
    } else {
      return "Input correct email";
    }
  }

  String checkValidatePassword(String Password) {
    if (Password.length < 8) {
      return "Minimum length is 8";
    } else if (validators.isValidPassword(Password) == false) {
      return "Incorrect Password";
    } else
      return "";
  }

  @override
  Widget build(BuildContext context) {
    LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    return BlocBuilder<LoginBloc, LoginState>(
        bloc: bloc,
        builder: (context, state) {
          return Container(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: 0.025 * Height)),
                  Container(
                    height: 22,
                    width: Width * 0.53,
                    padding: EdgeInsets.symmetric(horizontal: 0.0667 * Width),
                    child: Text(
                      AppLoginScreen.emailRemind,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFonts.fontAppRegular,
                          color: Color(0xff606060)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: Height * 0.046)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0.0667 * Width),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            AppLoginScreen.emailHint,
                            style: TextStyle(
                                fontFamily: AppFonts.fontAppRegular,
                                fontSize: 14,
                                color: Color(0xffA8A8A8)),
                          ),
                        ),
                        Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Container(
                            child: TextFormField(
                              decoration: InputDecoration(),
                              controller: emailController,
                              validator: (value) {
                                String check = value ?? "";
                                if (check == "") {
                                  return null;
                                } else {
                                  return checkValidateEmail(check);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: Height * 0.037, horizontal: Width * 0.067),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLoginScreen.passwordHint,
                                    style: TextStyle(
                                        fontFamily: AppFonts.fontAppRegular,
                                        fontSize: 14,
                                        color: Color(0xffA8A8A8)),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "/ForgotPasswordScreen");
                                      },
                                      child: Container(
                                        child: Text(
                                          AppLoginScreen.forgotPassword,
                                          style: TextStyle(
                                              fontFamily:
                                                  AppFonts.fontAppRegular,
                                              fontSize: 14,
                                              color: Color(0xff606060)),
                                        ),
                                      ))
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 25),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(),
                                  controller: passWordController,
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: (70),
                    padding: EdgeInsets.symmetric(horizontal: 0.05 * Width),
                    child: TextButton(
                      onPressed: () {
                        bloc.add(LoginWithCredentialsPressed(
                            email: emailController.text,
                            password: passWordController.text));
                      },
                      child: Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff30BE76),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)))),
                          Container(
                              alignment: Alignment.center,
                              child: Text(AppLoginScreen.loginButton,
                                  style: TextStyle(
                                      fontFamily: AppFonts.fontAppRegular,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 0.037 * Height),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              AppLoginScreen.newScracth,
                              style: TextStyle(
                                color: Color(0xffA8A8A8),
                                fontFamily: AppFonts.fontAppRegular,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/SignUpScreen");
                              },
                              child: Text(
                                AppLoginScreen.createAccount,
                                style: TextStyle(
                                    fontFamily: AppFonts.fontAppRegular,
                                    fontSize: 16,
                                    letterSpacing: 0.32,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff30BE76)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
