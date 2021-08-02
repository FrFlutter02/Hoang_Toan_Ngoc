import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../constants/constants_color.dart';
import '../constants/constants_text.dart';
import '../widgets/form_sign_up.dart';
import '../widgets/logo.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bannerLeftPadding = MediaQuery.of(context).size.width * 25 / 375;
    double mainTabletPadding = 0;
    CrossAxisAlignment bannerCrossAxisAlignment = CrossAxisAlignment.start;
    double logoTopPadding = 0;
    double titleTopPadding = 0;
    double titleBottomPadding = 0;
    double formBottomPadding = 0;
    double bannerFlex = 0;
    double formHeight = 0;
    String title = "";

    if (Device.get().isPhone) {
      bannerCrossAxisAlignment = CrossAxisAlignment.start;
      logoTopPadding = MediaQuery.of(context).size.height * 60 / 812;
      titleTopPadding = MediaQuery.of(context).size.height * 45 / 812;
      titleBottomPadding = MediaQuery.of(context).size.height * 88 / 812;
      formBottomPadding = 0;
      mainTabletPadding = 0;
      bannerFlex = MediaQuery.of(context).size.height * 285 / 812;
      formHeight = MediaQuery.of(context).size.height * 527 / 812;
      title = SignUpText.titleMobileText;
    } else {
      bannerCrossAxisAlignment = CrossAxisAlignment.center;
      logoTopPadding = MediaQuery.of(context).size.height * 80 / 1024;
      titleTopPadding = MediaQuery.of(context).size.height * 130 / 1024;
      titleBottomPadding = MediaQuery.of(context).size.height * 36 / 1024;
      formBottomPadding = MediaQuery.of(context).size.height * 172 / 1024;
      bannerFlex = MediaQuery.of(context).size.height * 305 / 1024;
      formHeight = MediaQuery.of(context).size.height * 547 / 1024;
      mainTabletPadding = MediaQuery.of(context).size.width * 172 / 768;
      title = SignUpText.titleText;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              if (Device.get().isPhone)
                (Column(
                  children: [
                    Container(
                      height: bannerFlex,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(90.0)),
                        child: Opacity(
                            opacity: 0.7,
                            child: Image(
                              image: AssetImage(
                                AppImages.imageSignUpPath,
                              ),
                              fit: BoxFit.cover,
                              alignment: FractionalOffset.topLeft,
                              width: double.infinity,
                            )),
                      ),
                    ),
                  ],
                ))
              else
                (ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.7),
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.4),
                        Colors.white.withOpacity(0.1),
                        Colors.white.withOpacity(0),
                      ]).createShader(bounds),
                  child: Container(
                    child: Image.asset(
                      AppImages.imageSignUpPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mainTabletPadding),
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: bannerLeftPadding),
                        child: Column(
                          crossAxisAlignment: bannerCrossAxisAlignment,
                          children: [
                            SizedBox(height: logoTopPadding),
                            Logo(),
                            SizedBox(height: titleTopPadding),
                            Text(title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        color:
                                            Color(AppSignUpScreen.titleColor),
                                        fontFamily: AppFonts.fontAppBold)),
                            SizedBox(height: titleBottomPadding),
                          ],
                        ),
                      ),
                    ),
                    if (Device.get().isPhone)
                      (Container(
                        height: formHeight,
                        child: FormSignUp(),
                      ))
                    else
                      (Container(
                        height: formHeight,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            child: FormSignUp(),
                          ),
                        ),
                      )),
                    SizedBox(
                      height: formBottomPadding,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
