import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../constants/constants_color.dart';
import '../constants/constants_text.dart';
import '../blocs/authentication_bloc/authentication_bloc.dart';
import '../blocs/authentication_bloc/authentication_event.dart';
import '../blocs/sign_up_bloc/sign_up_bloc.dart';
import '../blocs/sign_up_bloc/sign_up_event.dart';
import '../blocs/sign_up_bloc/sign_up_state.dart';
import '../utils/validators.dart';
import '../repository/user_repository.dart';

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

  double btnSignUpHeight = 0;
  double formPadding = 0;
  double subTitleTopPadding = 0;
  double subTitleBottomPadding = 0;
  double textFieldTopPadding = 0;
  double btnAndFooterTitlePadding = 0;
  double footerBottomPadding = 0;
  bool emailValidators = false;
  bool passWordValidators = false;
  bool fullNameValidators = false;
  @override
  Widget build(BuildContext context) {
    if (Device.get().isPhone) {
      formPadding = MediaQuery.of(context).size.width * 25 / 375;
      btnSignUpHeight = MediaQuery.of(context).size.height * 50 / 812;
      subTitleTopPadding = MediaQuery.of(context).size.height * 20 / 812;
      subTitleBottomPadding = MediaQuery.of(context).size.height * 30 / 812;
      textFieldTopPadding = MediaQuery.of(context).size.height * 30 / 812;
      btnAndFooterTitlePadding = MediaQuery.of(context).size.height * 30 / 812;
      footerBottomPadding = MediaQuery.of(context).size.height * 45 / 812;
    } else {
      formPadding = MediaQuery.of(context).size.width * 50 / 768;
      btnSignUpHeight = MediaQuery.of(context).size.height * 50 / 1024;
      subTitleTopPadding = MediaQuery.of(context).size.height * 50 / 1024;
      subTitleBottomPadding = MediaQuery.of(context).size.height * 30 / 1024;
      textFieldTopPadding = MediaQuery.of(context).size.height * 25 / 1024;
      btnAndFooterTitlePadding = MediaQuery.of(context).size.height * 30 / 1024;
      footerBottomPadding = MediaQuery.of(context).size.height * 45 / 1024;
    }

    return Scaffold(
        body: BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
      switch (state.runtimeType) {
        case SignUpSuccess:
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthenticationLoggedIn());
          Navigator.of(context).pushNamed("/home");
          break;
      }
    }, builder: (context, state) {
      return SingleChildScrollView(
        child: Form(
          key: _form,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: formPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: subTitleTopPadding),
                Text(SignUpText.createAccountToContinueText,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Color(AppSignUpScreen.subTitleColor),
                        fontFamily: AppFonts.fontAppRegular,
                        letterSpacing: 0)),
                SizedBox(height: subTitleBottomPadding),
                Text(SignUpText.fullNameText,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Color(AppSignUpScreen.labelColor),
                        fontFamily: AppFonts.fontAppRegular,
                        letterSpacing: 0,
                        height: 1.57)),
                TextFormField(
                    cursorColor: Color(AppSignUpScreen.mainGreenColor),
                    controller: fullNameController,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(AppSignUpScreen.mainGreenColor),
                        width: 2,
                      ),
                    )),
                    validator: (nameValue) {
                      if (nameValue!.isEmpty) {
                        fullNameValidators = false;
                        return AppConstantsText.validateNameText;
                      } else {
                        fullNameValidators = true;
                        return null;
                      }
                    }),
                SizedBox(height: textFieldTopPadding),
                Text(SignUpText.emailText,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Color(AppSignUpScreen.labelColor),
                        fontFamily: AppFonts.fontAppRegular,
                        letterSpacing: 0,
                        height: 1.57)),
                TextFormField(
                    cursorColor: Color(AppSignUpScreen.mainGreenColor),
                    controller: emailController,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(AppSignUpScreen.mainGreenColor),
                        width: 2,
                      ),
                    )),
                    validator: (emailValue) {
                      if (Validators.isValidEmail(emailValue!)) {
                        emailValidators = true;
                        if (state is SignUpLoading) {
                          return null;
                        } else if (state is SignUpAuthFailure) {
                          if (state.exception.code ==
                              SignUpText.exceptionErrorEmailText) {
                            return state.exception.code;
                          }
                        } else {
                          return null;
                        }
                      } else {
                        emailValidators = false;
                        return AppConstantsText.validateEmailText;
                      }
                    }),
                SizedBox(height: textFieldTopPadding),
                Text(SignUpText.passwordText,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Color(AppSignUpScreen.labelColor),
                        fontFamily: AppFonts.fontAppRegular,
                        letterSpacing: 0,
                        height: 1.57)),
                TextFormField(
                    cursorColor: Color(AppSignUpScreen.mainGreenColor),
                    controller: passWordController,
                    obscureText: true,
                    obscuringCharacter: AppConstantsText.obscuringCharacter,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(AppSignUpScreen.mainGreenColor),
                        width: 2,
                      ),
                    )),
                    validator: (passWordValue) {
                      if (Validators.isValidPassword(passWordValue!)) {
                        passWordValidators = true;
                        return null;
                      } else {
                        passWordValidators = false;
                        return AppConstantsText.validatePassWordText;
                      }
                    }),
                SizedBox(height: textFieldTopPadding),
                SizedBox(
                    width: double.infinity,
                    height: btnSignUpHeight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(AppSignUpScreen.mainGreenColor),
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
                                    emailController.text,
                                    passWordController.text,
                                    fullNameController.text,
                                  ));
                            }
                          },
                          child: Text(
                            SignUpText.createAccountText,
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
                SizedBox(height: btnAndFooterTitlePadding),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        SignUpText.alreadyHaveAnAccountText,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Color(AppSignUpScreen.footerTitleColor),
                            fontFamily: AppFonts.fontAppRegular),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/loginScreen');
                        },
                        child: Text(
                          SignUpText.loginHereText,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Color(AppSignUpScreen.mainGreenColor),
                                  height: 1.375,
                                  fontFamily: AppFonts.fontAppRegular,
                                  letterSpacing: 0.32),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: footerBottomPadding),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
