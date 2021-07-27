import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../constants/constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    double topSpacing = 0;
    double heightImageBackground = 0;
    double iconWidth = 0;
    double iconHeight = 0;
    double iconAndTopSpacing = 0;
    double iconAndTextSpacing = 0;
    double iconPadding = 0;
    double iconAndBottomSpacing = 0;
    double tutorialShareRecipesTextPadding = 0;
    double tutorialJoinScratchSpacing = 0;
    double tutorialJoinScratchPadding = 0;
    double buttonAndTopSpacing = 0;
    double buttonPadding = 0;
    double joinScratchButtonWidth = 0;
    double joinScratchButtonHeight = 0;
    double learnMoreButtonWidth = 0;
    double learnMoreButtonHeight = 0;
    List<Color> linearGradientColor = [];

    if (Device.get().isPhone) {
      linearGradientColor = [
        Colors.white.withOpacity(0),
        Colors.white.withOpacity(0),
        Colors.white.withOpacity(0.5),
      ];
      topSpacing = heightScreen * 3.37 / 8.12;
      heightImageBackground = heightScreen * 4.75 / 8.12;
      iconWidth = widthScreen * 0.2524 / 3.75;
      iconHeight = heightScreen * 0.3621 / 8.12;
      iconAndTopSpacing = heightScreen * 3.6 / 8.12;
      iconAndTextSpacing = widthScreen * 0.205 / 3.75;
    } else if (Device.get().isTablet) {
      linearGradientColor = [
        Colors.white.withOpacity(0),
        Colors.white.withOpacity(0),
        Colors.white.withOpacity(0.3),
        Colors.white.withOpacity(0.5),
      ];
      topSpacing = heightScreen * 3.3 / 10.24;
      heightImageBackground = heightScreen * 8.74 / 10.24;
      iconAndTopSpacing = heightScreen * 0.8 / 10.24;
      iconHeight = heightScreen * 0.26 / 10.24;
      iconWidth = widthScreen * 0.18 / 7.68;
      iconPadding = widthScreen * 3.35 / 7.68;
      iconAndBottomSpacing = heightScreen * 1.31 / 10.24;
      tutorialShareRecipesTextPadding = widthScreen * 1.44 / 7.68;
      tutorialJoinScratchSpacing = heightScreen * 0.08 / 10.24;
      tutorialJoinScratchPadding = widthScreen * 2.27 / 7.68;
      buttonAndTopSpacing = heightScreen * 0.34 / 10.24;
      buttonPadding = widthScreen * 1.35 / 7.68;
      joinScratchButtonWidth = widthScreen * 2.39 / 7.68;
      joinScratchButtonHeight = heightScreen * 0.5 / 10.24;
      learnMoreButtonWidth = widthScreen * 2.39 / 7.68;
      learnMoreButtonHeight = heightScreen * 0.5 / 10.24;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: linearGradientColor)
                  .createShader(bounds),
              child: Column(
                children: [
                  SizedBox(height: topSpacing),
                  Container(
                    height: heightImageBackground,
                    width: widthScreen,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.backGroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (Device.get().isPhone)
              (InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/ForgotPasswordScreen');
                },
                child: Container(
                  width: widthScreen,
                  height: heightScreen,
                  child: Column(
                    children: [
                      SizedBox(height: iconAndTopSpacing),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage(AppIcons.logoIcon),
                              width: iconWidth,
                              height: iconHeight),
                          SizedBox(width: iconAndTextSpacing),
                          Text(AppConstants.textIcon,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    fontFamily: AppFonts.fontAppSemiBold,
                                    letterSpacing: 0.4,
                                  ))
                        ],
                      )
                    ],
                  ),
                ),
              ))
            else if (Device.get().isTablet)
              (Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: iconAndTopSpacing),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: iconPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: iconHeight,
                          width: iconWidth,
                          image: AssetImage(AppIcons.logoIcon),
                        ),
                        Spacer(),
                        Text(AppConstants.textIcon,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    fontFamily: AppFonts.fontAppBold,
                                    letterSpacing: 0.4,
                                    height: 1,
                                    color: Color(
                                        AppOnBoardingScreen.iconTextColor))),
                      ],
                    ),
                  ),
                  SizedBox(height: iconAndBottomSpacing),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: tutorialShareRecipesTextPadding),
                    child: Text(AppConstants.tutorialShareRecipesText,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            letterSpacing: -0.5,
                            fontFamily: AppFonts.fontAppSemiBold,
                            fontSize: 40,
                            height: 1.375,
                            color: Color(AppOnBoardingScreen
                                .tutorialShareRecipesTextColor)),
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(height: tutorialJoinScratchSpacing),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: tutorialJoinScratchPadding),
                    child: Text(
                      AppConstants.tutorialJoinScratchText,
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          letterSpacing: 0,
                          fontFamily: AppFonts.fontAppRegular,
                          height: 1.57,
                          color: Color(AppOnBoardingScreen
                              .tutorialJoinScratchTextColor)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: buttonAndTopSpacing),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: buttonPadding),
                    child: Row(
                      children: [
                        Container(
                          width: joinScratchButtonWidth,
                          height: joinScratchButtonHeight,
                          decoration: BoxDecoration(
                              color: Color(
                                  AppOnBoardingScreen.joinScratchButtonCollor),
                              borderRadius: BorderRadius.circular(8)),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              AppConstants.joinScratchButton,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                      color: Colors.white,
                                      height: 1.312,
                                      letterSpacing: 0,
                                      fontFamily: AppFonts.fontAppBold),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: learnMoreButtonWidth,
                          height: learnMoreButtonHeight,
                          decoration: BoxDecoration(
                              color: Color(
                                  AppOnBoardingScreen.leanMoreButtonColor),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Color(AppOnBoardingScreen
                                      .learMoreButtonBorderColor),
                                  width: 2)),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              AppConstants.learnMoreButton,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                      color: Color(AppOnBoardingScreen
                                          .learnMoreButtonTextColor),
                                      letterSpacing: 0.32,
                                      height: 1.375,
                                      fontFamily: AppFonts.fontAppBold),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))
          ],
        ),
      ),
    );
  }
}
