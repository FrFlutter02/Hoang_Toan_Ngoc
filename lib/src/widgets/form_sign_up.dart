import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:mobile_app/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:mobile_app/src/blocs/authentication_bloc/authentication_event.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_event.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_state.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_state.dart';

import '../utils/validators.dart';
import '../repository/user_repository.dart';
import '../constants/constants.dart';

class FormSignUp extends StatefulWidget {
  FormSignUp({
    Key? key,
  }) : super(key: key);

  @override
  _FormSignUpState createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  final _form = GlobalKey<FormState>();
  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
  }

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final passWordController = TextEditingController();
  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    double btnSignUpHeight = 0;
    double formPadding = 0;
    int subTitleTopPadding = 0;
    int subTitleBottomPadding = 0;
    int textFieldTopPadding = 0;
    int btnAndFooterTitlePadding = 0;
    int footerBottomPadding = 0;
    bool emailValidators = false;
    bool passWordValidators = false;
    bool fullNameValidators = false;
    if (Device.get().isPhone) {
      formPadding = 25;
      btnSignUpHeight = 50;
      subTitleTopPadding = 20;
      subTitleBottomPadding = 30;
      textFieldTopPadding = 30;
      btnAndFooterTitlePadding = 30;
      footerBottomPadding = 45;
    } else {
      formPadding = MediaQuery.of(context).size.width * (50 / 768);
      btnSignUpHeight = MediaQuery.of(context).size.height * (50 / 1024);
      subTitleTopPadding = 50;
      subTitleBottomPadding = 30;
      textFieldTopPadding = 25;
      btnAndFooterTitlePadding = 30;
      footerBottomPadding = 45;
    }

    return Scaffold(
        body: BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.isSuccess == true && (state.isFailure == true)) {
          Navigator.of(context).pushNamed("/Home");
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthenticationLoggedIn());
        }
      },
      child: Form(
        key: _form, //assigning key to form
        child: BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: formPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: subTitleTopPadding),
                Text(AppConstants.createAccountToContinueText,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Color(AppSignUpScreen.subTitleColor),
                        fontFamily: AppFonts.fontAppRegular,
                        letterSpacing: 0)),
                Spacer(flex: subTitleBottomPadding),
                Text(AppConstants.fullNameText,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Color(AppSignUpScreen.labelColor),
                        fontFamily: AppFonts.fontAppRegular,
                        letterSpacing: 0,
                        height: 1.57)),
                TextFormField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15, bottom: 6),
                    ),
                    validator: (nameValue) {
                      if (nameValue!.length < 3) {
                        fullNameValidators = false;
                        return AppConstants.validateNameText;
                      } else {
                        fullNameValidators = true;
                        return null;
                      }
                    }),
                Spacer(flex: textFieldTopPadding),
                Text(AppConstants.emailText,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Color(AppSignUpScreen.labelColor),
                        fontFamily: AppFonts.fontAppRegular,
                        letterSpacing: 0,
                        height: 1.57)),
                TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15, bottom: 6),
                    ),
                    validator: (emailValue) {
                      if (Validators.isValidEmail(emailValue!)) {
                        emailValidators = true;
                        return null;
                      } else {
                        emailValidators = false;
                        return AppConstants.validateEmailText;
                      }
                    }),
                Spacer(flex: textFieldTopPadding),
                Text(AppConstants.passwordText,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Color(AppSignUpScreen.labelColor),
                        fontFamily: AppFonts.fontAppRegular,
                        letterSpacing: 0,
                        height: 1.57)),
                TextFormField(
                    controller: passWordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15, bottom: 6),
                    ),
                    validator: (passWordValue) {
                      if (Validators.isValidPassword(passWordValue!)) {
                        passWordValidators = true;
                        return null;
                      } else {
                        passWordValidators = false;
                        return AppConstants.validatePassWordText;
                      }
                    }),
                Spacer(flex: textFieldTopPadding),
                SizedBox(
                    width: double.infinity,
                    height: btnSignUpHeight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(AppSignUpScreen.primaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: TextButton(
                          onPressed: () async {
                            _saveForm();
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (fullNameValidators == true &&
                                emailValidators == true &&
                                passWordValidators == true) {
                              context.read<SignUpBloc>().add(SignUpSubmitted(
                                    email: emailController.text,
                                    fullName: fullNameController.text,
                                    password: passWordController.text,
                                  ));
                            }
                          },
                          child: Text(
                            AppConstants.createAccountText,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    color: Colors.white,
                                    fontFamily: AppFonts.fontAppRegular,
                                    height: 1.3125,
                                    letterSpacing: 0),
                          )),
                    )),
                Spacer(flex: btnAndFooterTitlePadding),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        AppConstants.alreadyHaveAnAccountText,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Color(AppSignUpScreen.footerTitleColor),
                            fontFamily: AppFonts.fontAppRegular),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/LoginScreen');
                        },
                        child: Text(
                          AppConstants.loginHereText,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Color(AppSignUpScreen.primaryColor),
                                  height: 1.375,
                                  fontFamily: AppFonts.fontAppRegular,
                                  letterSpacing: 0.32),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: footerBottomPadding)
              ],
            ),
          );
        }),
      ),
    ));
  }
}
