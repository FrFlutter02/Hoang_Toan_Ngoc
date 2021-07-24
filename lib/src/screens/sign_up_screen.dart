import 'package:flutter/material.dart';

import '../responsive/responsiveWidget.dart';
import '../widgets/form_sign_up.dart';
import '../constants/constants.dart';
import '../widgets/logo.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double mainLeftPadding = MediaQuery.of(context).size.width * (25 / 375);
    double mainTabletPadding = MediaQuery.of(context).size.width * (172 / 768);
    // double imageHeight = MediaQuery.of(context).size.height * (526 / 768);
    // double imageWidth = MediaQuery.of(context).size.width * (420 / 375);
    if (deviceWidth > 600) {}
    return Scaffold(
      body: ResponsiveWidget(
        mobile: Column(
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
                      image: AssetImage(
                        "assets/images/imageSignUp.jpeg",
                      ),
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topLeft,
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
                        Text(SignUpScreenConstants.titleTopText,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color:
                                        Color(SignUpScreenConstants.titleColor),
                                    fontWeight: FontWeight.bold)),
                        Text(SignUpScreenConstants.titleBottomText,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color:
                                        Color(SignUpScreenConstants.titleColor),
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
        tablet: Stack(
          children: [
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.7),
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0),
                  ]).createShader(bounds),
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/imageSignUp.jpeg",
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: mainTabletPadding, right: mainTabletPadding),
              child: Column(
                children: [
                  Expanded(
                    flex: 305,
                    child: Column(
                      children: [
                        Spacer(flex: 80),
                        Logo(),
                        Spacer(flex: 130),
                        Text(SignUpScreenConstants.titleText,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color:
                                        Color(SignUpScreenConstants.titleColor),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito')),
                        Spacer(flex: 36)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 547,
                    child: Container(
                      // height: FormTabletHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.white,
                      ),
                      child: FormSignUp(),
                    ),
                  ),
                  Expanded(
                    flex: 172,
                    child: Center(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
