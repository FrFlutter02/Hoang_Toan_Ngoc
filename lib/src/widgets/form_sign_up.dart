import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../blocs/authentication_bloc/authentication_bloc.dart';
import '../blocs/authentication_bloc/authentication_event.dart';
import '../blocs/sign_up_bloc/sign_up_bloc.dart';
import '../blocs/sign_up_bloc/sign_up_event.dart';
import '../blocs/sign_up_bloc/sign_up_state.dart';
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
    double subTitleTopPadding = 0;
    double subTitleBottomPadding = 0;
    double textFieldTopPadding = 0;
    double btnAndFooterTitlePadding = 0;
    double footerBottomPadding = 0;
    bool emailValidators = false;
    bool passWordValidators = false;
    bool fullNameValidators = false;
    if (Device.get().isPhone) {
      formPadding = MediaQuery.of(context).size.width * 25 / 375;
      btnSignUpHeight = MediaQuery.of(context).size.height * 50 / 812;
      subTitleTopPadding = MediaQuery.of(context).size.height * 20 / 812;
      subTitleBottomPadding = MediaQuery.of(context).size.height * 30 / 812;
      textFieldTopPadding = MediaQuery.of(context).size.height * 30 / 812;
      btnAndFooterTitlePadding = MediaQuery.of(context).size.height * 30 / 812;
      footerBottomPadding = MediaQuery.of(context).size.height * 45 / 812;
    } else {
      formPadding = MediaQuery.of(context).size.width * (50 / 768);
      btnSignUpHeight = MediaQuery.of(context).size.height * (50 / 1024);
      subTitleTopPadding = MediaQuery.of(context).size.height * 50 / 1024;
      subTitleBottomPadding = MediaQuery.of(context).size.height * 30 / 1024;
      textFieldTopPadding = MediaQuery.of(context).size.height * 25 / 1024;
      btnAndFooterTitlePadding = MediaQuery.of(context).size.height * 30 / 1024;
      footerBottomPadding = MediaQuery.of(context).size.height * 45 / 1024;
    }

    return Scaffold(
        body: BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.of(context).pushNamed("/Home");
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthenticationLoggedIn());
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: _form,
          child:
              BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: formPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: subTitleTopPadding),
                  Text(AppConstants.createAccountToContinueText,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Color(AppSignUpScreen.subTitleColor),
                          fontFamily: AppFonts.fontAppRegular,
                          letterSpacing: 0)),
                  SizedBox(height: subTitleBottomPadding),
                  Text(AppConstants.fullNameText,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Color(AppSignUpScreen.labelColor),
                          fontFamily: AppFonts.fontAppRegular,
                          letterSpacing: 0,
                          height: 1.57)),
                  TextFormField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(AppSignUpScreen.primaryColor),
                          width: 2,
                        ),
                      )),
                      validator: (nameValue) {
                        if (nameValue!.length < 3) {
                          fullNameValidators = false;
                          return AppConstants.validateNameText;
                        } else {
                          fullNameValidators = true;
                          return null;
                        }
                      }),
                  SizedBox(height: textFieldTopPadding),
                  Text(AppConstants.emailText,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Color(AppSignUpScreen.labelColor),
                          fontFamily: AppFonts.fontAppRegular,
                          letterSpacing: 0,
                          height: 1.57)),
                  TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(AppSignUpScreen.primaryColor),
                          width: 2,
                        ),
                      )),
                      validator: (emailValue) {
                        if (Validators.isValidEmail(emailValue!)) {
                          emailValidators = true;
                          return null;
                        } else {
                          emailValidators = false;
                          return AppConstants.validateEmailText;
                        }
                      }),
                  SizedBox(height: textFieldTopPadding),
                  Text(AppConstants.passwordText,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Color(AppSignUpScreen.labelColor),
                          fontFamily: AppFonts.fontAppRegular,
                          letterSpacing: 0,
                          height: 1.57)),
                  TextFormField(
                      controller: passWordController,
                      obscureText: true,
                      obscuringCharacter: '⬤',
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(AppSignUpScreen.primaryColor),
                          width: 2,
                        ),
                      )),
                      validator: (passWordValue) {
                        if (Validators.isValidPassword(passWordValue!)) {
                          passWordValidators = true;
                          return null;
                        } else {
                          passWordValidators = false;
                          return AppConstants.validatePassWordText;
                        }
                      }),
                  SizedBox(height: textFieldTopPadding),
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
                                      emailController.text,
                                      passWordController.text,
                                      fullNameController.text,
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
                  // Spacer(flex: btnAndFooterTitlePadding),
                  SizedBox(height: btnAndFooterTitlePadding),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          AppConstants.alreadyHaveAnAccountText,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  color:
                                      Color(AppSignUpScreen.footerTitleColor),
                                  fontFamily: AppFonts.fontAppRegular),
                        ),
                        InkWell(
                          onTap: () {
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
                  // Spacer(flex: footerBottomPadding)
                  SizedBox(height: footerBottomPadding),
                ],
              ),
            );
          }),
        ),
      ),
    ));
  }
}
