import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../constants/constants.dart';
import '../widgets/login_body.dart';

class Login_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;
    final double maxHeight = MediaQuery.of(context).size.height;
    String email = "";
    String password = "";
    if (Device.get().isPhone) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: maxWidth,
                    height: maxHeight * 0.35,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(AppLoginScreen.loginImage),
                      fit: BoxFit.fill,
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: maxHeight * 0.074),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 0.067 * maxWidth),
                          child: Row(
                            children: [
                              Container(
                                width: 18,
                                height: 26,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(AppLoginScreen.logo))),
                              ),
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            AppLoginScreen.textLogo))),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: maxHeight * 0.07)),
                        Container(
                            padding: EdgeInsets.only(left: 0.067 * maxWidth),
                            width: maxWidth * 0.811,
                            child: Text(
                              "Welcome Back!",
                              style:
                                  TextStyle(fontSize: 24, fontFamily: "Nunito"),
                            )),
                      ],
                    ),
                  )
                ],
              ),
              Login_Body(Width: maxWidth, Height: maxHeight)
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
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
                  colors: [Colors.white.withOpacity(0.1), Colors.white]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: maxHeight * 0.078),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: maxWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 18,
                        height: 26,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppLoginScreen.logo))),
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Container(
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppLoginScreen.textLogo))),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: maxHeight * 0.15)),
                Container(
                    alignment: Alignment.center,
                    width: maxWidth,
                    child: Text(
                      "Welcome Back!",
                      style: TextStyle(fontSize: 24, fontFamily: "Nunito"),
                    )),
              ],
            ),
          ),
          Center(
            child: Container(
              child: Center(
                child: Container(
                  width: 425,
                  height: 467,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  alignment: Alignment.center,
                  child: Center(
                    child: Login_Body(
                      Height: 467,
                      Width: 425,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
    }
  }
}
