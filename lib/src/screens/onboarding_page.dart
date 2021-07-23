import 'package:flutter/material.dart';

import '../constants/constants.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    double topSpacing = heightScreen * 3.37 / 8.12;
    double heightImageBackground = heightScreen * 4.75 / 8.12;
    double iconAndTopSpacing = heightScreen * 3.6 / 8.12;
    double iconWidth = widthScreen * 0.2524 / 3.75;
    double iconHeight = heightScreen * 0.3621 / 8.12;
    double iconAndTextSpacing = widthScreen * 0.205 / 3.75;

    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/ForgotPasswordPage');
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0),
                        Colors.white.withOpacity(0),
                        Colors.white.withOpacity(0.5),
                      ]).createShader(bounds),
                  child: Column(
                    children: [
                      SizedBox(height: topSpacing),
                      Container(
                        height: heightImageBackground,
                        width: widthScreen,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImage.backGroundImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: iconAndTopSpacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage(AppImage.logoIcon),
                            width: iconWidth,
                            height: iconHeight),
                        SizedBox(width: iconAndTextSpacing),
                        Text(AppConstants.textIcon,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith())
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
