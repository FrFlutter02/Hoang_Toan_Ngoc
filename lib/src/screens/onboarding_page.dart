import 'package:flutter/material.dart';

import '../constants/constants.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return PhoneLayout();
        } else {
          return TabletLayout();
        }
      },
    ));
  }
}

class PhoneLayout extends StatelessWidget {
  const PhoneLayout({Key? key}) : super(key: key);

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

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/ForgotPasswordPage');
      },
      child: SingleChildScrollView(
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
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontFamily: "Nunito-Bold",
                              letterSpacing: 0.4,
                            ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TabletLayout extends StatelessWidget {
  const TabletLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    double topSpacing = heightScreen * 3.3 / 10.24;
    double heightImageBackground = heightScreen * 8.74 / 10.24;
    double iconAndTopSpacing = heightScreen * 0.8 / 10.24;
    double iconHeight = heightScreen * 0.26 / 10.24;
    double iconWidth = widthScreen * 0.18 / 7.68;
    double iconPadding = widthScreen * 3.35 / 7.68;
    double iconAndBottomSpacing = heightScreen * 1.31 / 10.24;
    double tutorialShareRecipesTextPadding = widthScreen * 1.44 / 7.68;
    double tutorialJoinScratchSpacing = heightScreen * 0.08 / 10.24;
    double tutorialJoinScratchPadding = widthScreen * 2.27 / 7.68;
    double buttonAndTopSpacing = heightScreen * 0.34 / 10.24;
    double buttonPadding = widthScreen * 1.35 / 7.68;
    double joinScratchButtonWidth = widthScreen * 2.39 / 7.68;
    double joinScratchButtonHeight = heightScreen * 0.5 / 10.24;
    double learnMoreButtonWidth = widthScreen * 2.39 / 7.68;
    double learnMoreButtonHeight = heightScreen * 0.5 / 10.24;

    return SingleChildScrollView(
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0),
                  Colors.white.withOpacity(0),
                  Colors.white.withOpacity(0.3),
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
                  )),
                ),
              ],
            ),
          ),
          Column(
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
                      image: AssetImage(AppImage.logoIcon),
                    ),
                    Spacer(),
                    Text(AppConstants.textIcon,
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontFamily: "Nunito-Bold",
                            letterSpacing: 0.4,
                            height: 1,
                            color: Color(AppOnboardingPage.iconTextColor))),
                  ],
                ),
              ),
              SizedBox(height: iconAndBottomSpacing),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: tutorialShareRecipesTextPadding),
                child: Text(AppConstants.tutorialShareRecipesText,
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                        letterSpacing: -0.5,
                        fontFamily: "Nunito-SemiBold",
                        fontSize: 45,
                        height: 1.45,
                        color: Color(
                            AppOnboardingPage.tutorialShareRecipesTextColor)),
                    textAlign: TextAlign.center),
              ),
              SizedBox(height: tutorialJoinScratchSpacing),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: tutorialJoinScratchPadding),
                child: Text(
                  AppConstants.tutorialJoinScratchText,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontSize: 16,
                      letterSpacing: 0,
                      fontFamily: "Nunito-Regular",
                      height: 1.7,
                      color: Color(
                          AppOnboardingPage.tutorialJoinScratchTextColor)),
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
                          color:
                              Color(AppOnboardingPage.joinScratchButtonCollor),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppConstants.joinScratchButton,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: Colors.white,
                                  letterSpacing: 0,
                                  fontFamily: "Nunito-SemiBold"),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: learnMoreButtonWidth,
                      height: learnMoreButtonHeight,
                      decoration: BoxDecoration(
                          color: Color(AppOnboardingPage.leanMoreButtonColor),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Color(
                                  AppOnboardingPage.learMoreButtonBorderColor),
                              width: 2)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppConstants.learnMoreButton,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: Color(AppOnboardingPage
                                      .learnMoreButtonTextColor),
                                  letterSpacing: 0.32,
                                  fontFamily: "Nunito-SemiBold"),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
