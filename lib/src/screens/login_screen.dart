import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import '../widgets/logo.dart';
import '../blocs/login_blocs/login_blocs.dart';
import '../blocs/login_blocs/login_states.dart';
import '../screens/home_screen.dart';

import '../constants/constants.dart';
import '../widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;
    final double maxHeight = MediaQuery.of(context).size.height;
    LoginBloc loginBloc = BlocProvider.of(context);
    double loginImageHeight = 0;
    double loginImageWidth = 0;
    double logoTopMargin = 0;
    double logoIconContainerWidth = 0;
    double logoIconContainerHeight = 0;
    double logoTextContainerWidth = 0;
    double logoTextContainerHeight = 0;
    double logoLeftMargin = 0;
    double logoLeftPadding = 0;
    double welcomeBackPaddingTop = 0;
    double welcomeBackPaddingLeft = 0;
    double welcomeBackContainerWidth = 0;
    double welcomeBackFontSize = 0;
    double loginBodyWidthContainer = 0;
    double loginBodyHeightContainer = 0;
    if (Device.get().isPhone) {
      loginImageHeight = maxHeight * 0.35;
      loginImageWidth = maxWidth;
      logoTopMargin = maxHeight * 0.074;
      logoLeftMargin = 0.01 * maxWidth;
      logoLeftPadding = 10;
      logoIconContainerWidth = 18;
      logoIconContainerHeight = 26;
      logoTextContainerWidth = 70;
      logoTextContainerHeight = 20;
      welcomeBackPaddingTop = maxHeight * 0.07;
      welcomeBackPaddingLeft = maxWidth * 0.067;
      welcomeBackContainerWidth = maxWidth * 0.811;
      welcomeBackFontSize = 24;
      loginBodyWidthContainer = maxWidth;
      loginBodyHeightContainer = maxHeight * 0.65;
      return BlocBuilder<LoginBloc, LoginState>(
          bloc: loginBloc,
          builder: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushNamed(context, "/Home");
            }
            return Scaffold(
              extendBodyBehindAppBar: true,
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: loginImageHeight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(90.0)),
                              child: Opacity(
                                opacity: 0.7,
                                child: Image.asset(
                                  AppLoginScreen.backGroundLogin,
                                  fit: BoxFit.cover,
                                  alignment: FractionalOffset.topLeft,
                                  width: double.infinity,
                                  key: Key("imageMobile"),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: logoTopMargin),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Logo(),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: welcomeBackPaddingTop)),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: welcomeBackPaddingLeft),
                                    width: welcomeBackContainerWidth,
                                    child: Text(
                                      AppLoginScreen.welcomeBack,
                                      style: TextStyle(
                                          fontSize: welcomeBackFontSize,
                                          fontFamily: AppFonts.fontAppRegular),
                                    )),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: loginImageHeight)),
                              Container(
                                color: Colors.white,
                                child: Login_Body(
                                    Width: loginBodyWidthContainer,
                                    Height: loginBodyHeightContainer),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    } else {
      logoTopMargin = maxHeight * 0.078;
      logoIconContainerWidth = 18;
      logoIconContainerHeight = 26;
      logoLeftPadding = 10;
      logoTextContainerHeight = 20;
      logoTextContainerWidth = 70;
      logoLeftPadding = 10;
      welcomeBackPaddingTop = maxHeight * 0.15;
      welcomeBackFontSize = 24;
      loginBodyWidthContainer = 425;
      loginBodyHeightContainer = 467;
      return BlocBuilder<LoginBloc, LoginState>(
          bloc: loginBloc,
          builder: (context, state) {
            return Scaffold(
                extendBodyBehindAppBar: true,
                body: Stack(
                  children: [
                    Container(
                      child: Opacity(
                        opacity: 0.6,
                        child: Container(
                          width: maxWidth,
                          height: maxHeight,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(AppLoginScreen.backGroundLogin),
                            fit: BoxFit.fill,
                          )),
                        ),
                      ),
                    ),
                    Container(
                      width: maxWidth,
                      height: maxHeight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(0.1),
                              Colors.white
                            ]),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: logoTopMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: maxWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: logoIconContainerWidth,
                                  height: logoIconContainerHeight,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage(AppLoginScreen.logo))),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: logoLeftPadding)),
                                Container(
                                  width: logoTextContainerWidth,
                                  height: logoTextContainerHeight,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              AppLoginScreen.textLogo))),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: welcomeBackPaddingTop)),
                          Container(
                              alignment: Alignment.center,
                              width: maxWidth,
                              child: Text(
                                AppLoginScreen.welcomeBack,
                                style: TextStyle(
                                    fontSize: welcomeBackFontSize,
                                    fontFamily: AppFonts.fontAppRegular),
                              )),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        child: Center(
                          child: SingleChildScrollView(
                            child: Container(
                              width: loginBodyWidthContainer,
                              height: loginBodyHeightContainer,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              alignment: Alignment.center,
                              child: Center(
                                child: Login_Body(
                                  Height: loginBodyHeightContainer,
                                  Width: loginBodyWidthContainer,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          });
    }
  }
}
