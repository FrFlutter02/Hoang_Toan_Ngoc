import 'package:flutter/material.dart';

import 'text_field_sign_up.dart';
import '../constants/constants.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double btnSignUpHeight = MediaQuery.of(context).size.height * (50 / 812);
    double formPadding = MediaQuery.of(context).size.width * (25 / 375);
    return Padding(
      padding: EdgeInsets.only(left: formPadding, right: formPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: 20),
          Text(SignUpScreenConstants.createAccountToContinuteText,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Color(SignUpScreenConstants.subTitleColor),
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
          Spacer(flex: 30),
          TextFiedSignUp(
            lable: SignUpScreenConstants.fullNameText,
          ),
          Spacer(flex: 30),
          TextFiedSignUp(
            lable: SignUpScreenConstants.emailText,
          ),
          Spacer(flex: 30),
          TextFiedSignUp(
            lable: SignUpScreenConstants.passwordText,
          ),
          Spacer(flex: 30),
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
                      style: Theme.of(context).textTheme.button!.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
              )),
          Spacer(flex: 30),
          Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    SignUpScreenConstants.alreadyHaveAnAccountText,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(SignUpScreenConstants.foodTitleColor),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
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
          Spacer(flex: 45),
        ],
      ),
    );
  }
}
