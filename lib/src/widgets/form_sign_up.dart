import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    double btnSignUpHeight = 0;
    double formPadding = 0;
    int subTitleTopPadding = 0;
    int subTitleBottomPadding = 0;
    int textFieldTopPadding = 0;
    int btnAndFooterTitlePadding = 0;
    int footerBottomPadding = 0;

    if (deviceWidth < 600) {
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
              Text(SignUpScreenConstants.createAccountToContinueText,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Color(SignUpScreenConstants.subTitleColor),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppConstants.fontNunito,
                      letterSpacing: 0)),
              Spacer(flex: subTitleBottomPadding),
              Text(SignUpScreenConstants.fullNameText,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Color(SignUpScreenConstants.labelColor),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppConstants.fontNunito,
                      letterSpacing: 0,
                      height: 1.57)),
              TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15, bottom: 6),
                  ),
                  validator: (nameValue) {
                    if (nameValue!.length < 3) {
                      return SignUpScreenConstants.validateNameText;
                    }
                  }),
              Spacer(flex: textFieldTopPadding),
              Text(SignUpScreenConstants.emailText,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Color(SignUpScreenConstants.labelColor),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppConstants.fontNunito,
                      letterSpacing: 0,
                      height: 1.57)),
              TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15, bottom: 6),
                  ),
                  validator: (emailValue) {
                    return emailValue!.isValidEmail()
                        ? null
                        : SignUpScreenConstants.validateEmailText;
                  }),
              Spacer(flex: textFieldTopPadding),
              Text(SignUpScreenConstants.passwordText,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Color(SignUpScreenConstants.labelColor),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppConstants.fontNunito,
                      letterSpacing: 0,
                      height: 1.57)),
              TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15, bottom: 6),
                  ),
                  validator: (passWordValue) {
                    if (passWordValue!.length < 5) {
                      return SignUpScreenConstants.validatePassWordText;
                    }
                  }),
              Spacer(flex: textFieldTopPadding),
              SizedBox(
                  width: double.infinity,
                  height: btnSignUpHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(AppConstants.primaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: TextButton(
                        onPressed: () {
                          _saveForm();
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Text(
                          SignUpScreenConstants.createAccountText,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Colors.white,
                                  fontFamily: AppConstants.fontNunito,
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
                      SignUpScreenConstants.alreadyHaveAnAccountText,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Color(SignUpScreenConstants.footerTitleColor),
                          fontWeight: FontWeight.normal,
                          fontFamily: AppConstants.fontNunito),
                    ),
                    Text(
                      SignUpScreenConstants.loginHereText,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(AppConstants.primaryColor),
                          fontWeight: FontWeight.normal,
                          height: 1.375,
                          fontFamily: AppConstants.fontNunito,
                          letterSpacing: 0.32),
                    ),
                  ],
                ),
              ),
              Spacer(flex: footerBottomPadding)
            ],
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(SignUpScreenConstants.emailValidatorCode).hasMatch(this);
  }
}
