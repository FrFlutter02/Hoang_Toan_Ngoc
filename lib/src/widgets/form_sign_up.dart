import 'package:flutter/material.dart';

import 'text_field_sign_up.dart';
import '../constants/constants.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({
    Key? key,
  }) : super(key: key);

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
    return Padding(
      padding: EdgeInsets.only(left: formPadding, right: formPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: subTitleTopPadding),
          Text(SignUpScreenConstants.createAccountToContinuteText,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Color(SignUpScreenConstants.subTitleColor),
                  fontSize: 14,
                  fontWeight: FontWeight.normal)),
          Spacer(flex: subTitleBottomPadding),
          TextFiedSignUp(
            lable: SignUpScreenConstants.fullNameText,
          ),
          Spacer(flex: textFieldTopPadding),
          TextFiedSignUp(
            lable: SignUpScreenConstants.emailText,
          ),
          Spacer(flex: textFieldTopPadding),
          TextFiedSignUp(
            lable: SignUpScreenConstants.passwordText,
          ),
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
                    onPressed: () {},
                    child: Text(
                      SignUpScreenConstants.createAccountText,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.white, fontFamily: 'Nunito'),
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
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    SignUpScreenConstants.loginHereText,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(AppConstants.primaryColor),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          Spacer(flex: footerBottomPadding)
        ],
      ),
    );
  }
}
