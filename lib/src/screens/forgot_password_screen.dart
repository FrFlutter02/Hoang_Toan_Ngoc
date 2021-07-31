import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suorce_review/src/blocs/reset_password_blocs/reset_password_bloc.dart';

import '../constants/constants.dart';
import '../repositories/user_repository.dart';
import '../utils/validators.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key, required this.userRepository})
      : super(key: key);

  final UserRepository userRepository;

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  final _form = GlobalKey<FormState>();
  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
  }

  void checkResetPassword(context, state) {
    if (state is ResetPasswordSubmitSuccess) {
      if (state.success) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pushNamed('/Home');
          state.success = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool emailValidators = false;
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
    double contextPadding = 0;
    double iconAndTopSpacing = 0;
    double iconWidth = 0;
    double iconHeight = 0;
    double iconAndTextSpacing = 0;
    double startTextAndIconSpacing = 0;
    double containerSpacing = 0;
    double containerWidth = 0;
    double containerHeight = 0;
    double topContainerSpacing = 0;
    double resetPasswordFontSize = 0;
    double resetPasswordTextLetterSpacing = 0;
    double tutorialFontSize = 0;
    double tutorialLetterSpacing = 0;
    double tuttorialSpacing = 0;
    double emailTextSpacing = 0;
    double enterEmailFieldSpacing = 0;
    double buttonSpacing = 0;
    double heightButton = 0;
    double buttonFontSize = 0;

    if (Device.get().isPhone) {
      crossAxisAlignment = CrossAxisAlignment.start;
      contextPadding = widthScreen * 0.25 / 3.75;
      iconAndTopSpacing = heightScreen * 0.6 / 8.12;
      mainAxisAlignment = MainAxisAlignment.start;
      iconWidth = widthScreen * 0.18 / 3.75;
      iconHeight = heightScreen * 0.26 / 8.12;
      iconAndTextSpacing = widthScreen * 0.1 / 3.75;
      containerWidth = widthScreen;
      containerHeight = heightScreen;
      topContainerSpacing = heightScreen * 0.5 / 8.12;
      resetPasswordFontSize = 32;
      resetPasswordTextLetterSpacing = 0.5;
      tuttorialSpacing = heightScreen * 0.24 / 8.12;
      tutorialFontSize = 15;
      tutorialLetterSpacing = 0.5;
      emailTextSpacing = heightScreen * 1.06 / 8.12;
      enterEmailFieldSpacing = heightScreen * 0.2 / 8.12;
      buttonSpacing = heightScreen * 0.53 / 8.12;
      heightButton = heightScreen * 0.5 / 8.12;
      buttonFontSize = 24;
    } else if (Device.get().isTablet) {
      crossAxisAlignment = CrossAxisAlignment.center;
      iconAndTopSpacing = heightScreen * 0.8 / 10.24;
      mainAxisAlignment = MainAxisAlignment.center;
      iconWidth = widthScreen * 0.18 / 7.68;
      iconHeight = heightScreen * 0.26 / 10.24;
      iconAndTextSpacing = widthScreen * 0.1 / 7.68;
      startTextAndIconSpacing = heightScreen * 1.3 / 10.24;
      containerSpacing = heightScreen * 0.36 / 10.24;
      containerWidth = widthScreen * 4.25 / 7.68;
      containerHeight = heightScreen * 5.47 / 10.24;
      contextPadding = widthScreen * 0.5 / 7.68;
      topContainerSpacing = heightScreen * 0.5 / 10.24;
      tuttorialSpacing = heightScreen * 0.39 / 10.24;
      resetPasswordFontSize = 40;
      tutorialFontSize = 16;
      emailTextSpacing = heightScreen * 0.5742 / 10.24;
      enterEmailFieldSpacing = heightScreen * 0.2 / 10.24;
      buttonSpacing = heightScreen * 0.2758 / 10.24;
      heightButton = heightScreen * 0.5 / 10.24;
      buttonFontSize = 16;
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _form,
        child: Stack(
          children: [
            if (Device.get().isTablet)
              (ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.3),
                      Colors.white.withOpacity(0),
                    ]).createShader(bounds),
                child: Container(
                  width: widthScreen,
                  height: heightScreen,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.backGroundImage),
                          fit: BoxFit.cover)),
                ),
              ))
            else if (Device.get().isPhone)
              (ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ]).createShader(bounds),
                child: Container(
                  width: widthScreen,
                  height: heightScreen,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              )),
            Column(
              crossAxisAlignment: crossAxisAlignment,
              children: [
                SizedBox(height: iconAndTopSpacing),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: contextPadding),
                  child: Row(
                    mainAxisAlignment: mainAxisAlignment,
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
                                  fontFamily: AppFonts.fontAppBold,
                                  height: 1,
                                  color: Color(
                                      AppForgotPasswordScreen.iconTextColor),
                                  letterSpacing: 0.4)),
                    ],
                  ),
                ),
                SizedBox(height: startTextAndIconSpacing),
                if (Device.get().isTablet)
                  (Text(
                    AppConstants.startFromScratchText,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontFamily: AppFonts.fontAppRegular,
                        height: 1.1,
                        letterSpacing: 0,
                        color: Color(
                            AppForgotPasswordScreen.startFromScratchTextColor)),
                  )),
                SizedBox(height: containerSpacing),
                Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: contextPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: topContainerSpacing),
                        Text(
                          AppConstants.resetPasswordText,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(
                                  fontFamily: AppFonts.fontAppBold,
                                  fontSize: resetPasswordFontSize,
                                  letterSpacing: resetPasswordTextLetterSpacing,
                                  height: 1.1,
                                  color: Color(AppForgotPasswordScreen
                                      .resetPasswordColor)),
                        ),
                        SizedBox(height: tuttorialSpacing),
                        Text(AppConstants.tutorialText,
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      fontFamily: AppFonts.fontAppRegular,
                                      fontSize: tutorialFontSize,
                                      letterSpacing: tutorialLetterSpacing,
                                      height: 1.1,
                                      color: Color(AppForgotPasswordScreen
                                          .tutorialTextColor),
                                    )),
                        SizedBox(height: emailTextSpacing),
                        Text(
                          AppConstants.emailtext,
                          style:
                              Theme.of(context).textTheme.subtitle2?.copyWith(
                                  color: Color(
                                    AppForgotPasswordScreen.emailTextColor,
                                  ),
                                  fontFamily: AppFonts.fontAppRegular,
                                  letterSpacing: 0,
                                  height: 1.1),
                        ),
                        SizedBox(height: enterEmailFieldSpacing),
                        TextFormField(
                          controller: emailController,
                          validator: (emailValue) {
                            if (Validators.isValidEmail(emailValue!)) {
                              emailValidators = true;
                              return null;
                            } else {
                              emailValidators = false;
                              return AppConstants.validateEmailText;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(AppForgotPasswordScreen
                                        .lineInputBorderColor))),
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  color: Color(AppForgotPasswordScreen
                                      .emailAddressColor),
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
                          child: BlocBuilder<ResetPasswordBloc,
                              ResetPasswordState>(
                            builder: (context, state) {
                              checkResetPassword(context, state);
                              return TextButton(
                                onPressed: () {
                                  _saveForm();
                                  if (emailController.text.isNotEmpty &&
                                      emailValidators == true) {
                                    BlocProvider.of<ResetPasswordBloc>(context)
                                        .add(ResetPasswordSubmitted(
                                            email: emailController.text));
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    AppConstants.nameButton,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                            fontSize: buttonFontSize,
                                            color: Colors.white,
                                            fontFamily: AppFonts.fontAppRegular,
                                            height: 1.1,
                                            letterSpacing: 0),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
