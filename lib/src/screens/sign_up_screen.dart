import 'package:flutter/material.dart';

import '../widgets/form_sign_up.dart';
import '../constants/constants.dart';
import '../widgets/logo.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double mainLeftPadding = MediaQuery.of(context).size.width * (25 / 375);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 35,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(90.0)),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/imageSignUp.jpeg"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: mainLeftPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(flex: 60),
                      Logo(),
                      Spacer(flex: 45),
                      Text(SignUpScreenConstants.titleUpText,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  color:
                                      Color(SignUpScreenConstants.titleColor),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                      Text(SignUpScreenConstants.titleDownText,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  color:
                                      Color(SignUpScreenConstants.titleColor),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                      Spacer(flex: 88),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 65,
            child: FormSignUp(),
          ),
        ],
      ),
    );
  }
}
