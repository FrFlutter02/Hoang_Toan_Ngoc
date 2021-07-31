import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../utils/validators.dart';
import '../repositories/user_repository.dart';
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
        body: Form(
      key: _form, //assigning key to form
      child: Padding(
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
                        if (fullNameValidators == true &&
                            emailValidators == true &&
                            passWordValidators == true) {
                          String result = await userRepository.signUp(
                              emailController.text,
                              passWordController.text,
                              fullNameController.text);
                          if (result == "Success") {
                            Navigator.of(context).pushNamed("/Home");
                          } else {
                            SnackBar(
                              content: Text('Message is deleted!'),
                            );
                          }
                        }
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      child: Text(
                        AppConstants.createAccountText,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
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
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
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
      ),
    ));
  }
}