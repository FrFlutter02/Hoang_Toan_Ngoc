import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    double contextPadding = widthScreen * 0.25 / 3.75;
    double iconAndTopSpacing = heightScreen * 0.6 / 8.12;
    double iconWidth = widthScreen * 0.18 / 3.75;
    double iconHeight = heightScreen * 0.26 / 8.12;
    double iconAndTextSpacing = widthScreen * 0.1 / 3.75;
    double resetPasswordTextSpacing = heightScreen * 0.5 / 8.12;
    double tuttorialSpacing = heightScreen * 0.24 / 8.12;
    double emailTextSpacing = heightScreen * 1.06 / 8.12;
    double enterEmailFieldSpacing = heightScreen * 0.2 / 8.12;
    double buttonSpacing = heightScreen * 0.53 / 8.12;
    double heightButton = heightScreen * 0.5 / 8.12;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: contextPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: iconAndTopSpacing),
              Row(
                children: [
                  Image(
                      image: AssetImage(AppIcons.logoIcon),
                      width: iconWidth,
                      height: iconHeight),
                  SizedBox(width: iconAndTextSpacing),
                  Text(AppConstants.textIcon,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontFamily: AppFonts.fontAppBold,
                          height: 1,
                          color: Color(AppForgotPasswordScreen.iconTextColor),
                          letterSpacing: 0.4)),
                ],
              ),
              SizedBox(height: resetPasswordTextSpacing),
              Text(AppConstants.resetPasswordText,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontSize: 32,
                      letterSpacing: 0.5,
                      height: 1.1,
                      fontFamily: AppFonts.fontAppBold,
                      color:
                          Color(AppForgotPasswordScreen.resetPasswordColor))),
              SizedBox(height: tuttorialSpacing),
              Text(AppConstants.tutorialText,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontFamily: AppFonts.fontAppRegular,
                        fontSize: 15,
                        letterSpacing: 0.5,
                        height: 1.1,
                        color: Color(AppForgotPasswordScreen.tutorialTextColor),
                      )),
              SizedBox(height: emailTextSpacing),
              Text(
                AppConstants.emailtext,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: Color(
                      AppForgotPasswordScreen.emailTextColor,
                    ),
                    fontFamily: AppFonts.fontAppRegular,
                    letterSpacing: 0,
                    height: 1.1),
              ),
              SizedBox(height: enterEmailFieldSpacing),
              TextField(
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  isDense: true,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(
                              AppForgotPasswordScreen.lineInputBorderColor))),
                ),
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Color(AppForgotPasswordScreen.emailAddressColor),
                    letterSpacing: 0,
                    height: 1.1,
                    fontFamily: AppFonts.fontAppRegular),
              ),
              SizedBox(
                height: buttonSpacing,
              ),
              Container(
                width: widthScreen,
                height: heightButton,
                decoration: BoxDecoration(
                  color: Color(AppForgotPasswordScreen.buttonColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Text(
                      AppConstants.nameButton,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Colors.white,
                          fontFamily: AppFonts.fontAppRegular,
                          height: 1.1,
                          letterSpacing: 0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
