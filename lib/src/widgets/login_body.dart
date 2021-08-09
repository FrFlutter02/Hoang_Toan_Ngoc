import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/constants_color.dart';
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

  final Validators validators = Validators();

  @override
  Widget build(BuildContext context) {
    LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    final _form = GlobalKey<FormState>();
    final UserRepository _userRepository = UserRepository();
    String checkValidEmail = "";
    bool checkValidator = false;

    String checkValidateEmail(String email) {
      bool isValidEmail = validators.isValidEmail(email);
      if (isValidEmail == true) {
        return "valid";
      } else {
        return "Please input correct email";
      }
    }

    String checkValidatePassword(String Password) {
      if (Password.length < 8) {
        return "Minimum length is 8";
      }
      return "valid";
    }

    return BlocBuilder<LoginBloc, LoginState>(
        bloc: bloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoginFailure:
              checkValidator = true;

              break;
            default:
              checkValidator = false;
          }

          double formPaddingTop = 0.025 * Height;
          double formPaddingHorizontal = 0.0667 * Width;
          double mailRemindFontSize = 14;
          double emailInputPadding = Height * 0.046;
          double emailInputHorizontalPadding = 0.0667 * Width;
          double emailFontSize = 14;
          double emailRemindContainerWidth = Width * 0.53;
          double emailRemindContainerHeight = 22;
          double passwordVerticalPadding = Height * 0.037;
          double passwordHorizontalPadding = Width * 0.067;
          double passwordFontSize = 14;
          double loginHeightContainer = 70;
          double loginButtonHorizontalPadding = 0.05 * Width;
          double loginFontSize = 16;
          double newScratchPadding = 0.037 * Height;
          double newScratchFontSize = 14;
          double createAccountFontSize = 16;
          void _saveForm() {
            final isValid = _form.currentState!.validate();
            if (!isValid) {
              return;
            }
          }

          return Container(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: formPaddingTop)),
                  Container(
                    height: emailRemindContainerHeight,
                    width: emailRemindContainerWidth,
                    padding:
                        EdgeInsets.symmetric(horizontal: formPaddingHorizontal),
                    child: Text(
                      AppLoginScreen.emailRemind,
                      style: TextStyle(
                          fontSize: mailRemindFontSize,
                          fontFamily: AppFonts.fontAppRegular,
                          color: Color(AppLoginScreen.remindColor)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: emailInputPadding)),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: emailInputHorizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLoginScreen.emailHint,
                          style: TextStyle(
                              fontFamily: AppFonts.fontAppRegular,
                              fontSize: emailFontSize,
                              color: Color(AppLoginScreen.hintTextColor)),
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(),
                            controller: emailController,
                            onChanged: (value) {
                              checkValidator = false;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null;
                              } else if (checkValidator == true) {
                                if (checkValidateEmail(emailController.text) ==
                                    "valid") {
                                  return null;
                                } else {
                                  return checkValidateEmail(
                                      emailController.text);
                                }
                              } else
                                return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: passwordVerticalPadding,
                        horizontal: passwordHorizontalPadding),
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
                                        fontSize: passwordFontSize,
                                        color: Color(
                                            AppLoginScreen.hintTextColor)),
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
                                              fontSize: passwordFontSize,
                                              color: Color(
                                                  AppLoginScreen.remindColor)),
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
                                  onChanged: (value) {
                                    checkValidator = false;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return null;
                                    } else if (checkValidator == true) {
                                      if (checkValidatePassword(
                                              emailController.text) ==
                                          "valid") {
                                        return null;
                                      } else
                                        return checkValidatePassword(
                                            emailController.text);
                                    }
                                  },
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      bloc.add(LoginWithCredentialsPressed(
                          email: emailController.text,
                          password: passWordController.text));
                    },
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(
                          horizontal: loginButtonHorizontalPadding),
                      child: Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color:
                                      Color(AppColorConstants.systemGreenColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)))),
                          Container(
                              alignment: Alignment.center,
                              child: Text(AppLoginScreen.loginButton,
                                  style: TextStyle(
                                      fontFamily: AppFonts.fontAppRegular,
                                      fontSize: loginFontSize,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: newScratchPadding),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              AppLoginScreen.newScratch,
                              style: TextStyle(
                                color: Color(AppLoginScreen.hintTextColor),
                                fontFamily: AppFonts.fontAppRegular,
                                fontSize: newScratchFontSize,
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
                                    fontSize: createAccountFontSize,
                                    letterSpacing: 0.32,
                                    fontWeight: FontWeight.w700,
                                    color: Color(
                                        AppColorConstants.systemGreenColor)),
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
