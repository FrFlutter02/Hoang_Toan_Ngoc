import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../widgets/form_sign_up.dart';
import '../constants/constants.dart';
import '../widgets/logo.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double titleLeftPadding = MediaQuery.of(context).size.width * (25 / 375);
    double mainTabletPadding = 0;
    CrossAxisAlignment crossAxisAlignmentTitle;
    int logoTopPadding = 0;
    int titleTopPadding = 0;
    int titleBottomPadding = 0;
    int formBottomPadding = 0;
    int titleFlex = 0;
    int formFlex = 0;
    String title = "";
    if (Device.get().isPhone) {
      crossAxisAlignmentTitle = CrossAxisAlignment.start;
      logoTopPadding = 60;
      titleTopPadding = 45;
      titleBottomPadding = 88;
      formBottomPadding = 0;
      mainTabletPadding = 0;
      titleFlex = 35;
      formFlex = 65;
      title = SignUpScreenConstants.titleMobileText;
    } else {
      crossAxisAlignmentTitle = CrossAxisAlignment.center;
      logoTopPadding = 80;
      titleTopPadding = 130;
      titleBottomPadding = 36;
      formBottomPadding = 172;
      titleFlex = 305;
      formFlex = 547;
      mainTabletPadding = MediaQuery.of(context).size.width * (172 / 768);
      title = SignUpScreenConstants.titleText;
    }
    return Scaffold(
      body: Stack(
        children: [
          if (Device.get().isPhone)
            (Column(
              children: [
                Flexible(
                  flex: titleFlex,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(90.0)),
                    child: (Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            SignUpScreenConstants.imageSignUpPath,
                          ),
                          fit: BoxFit.fitWidth,
                          alignment: FractionalOffset.topLeft,
                        ),
                      ),
                    )),
                  ),
                ),
                Flexible(
                  flex: formFlex,
                  child: Center(),
                )
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
                width: double.infinity,
                child: Image.asset(
                  SignUpScreenConstants.imageSignUpPath,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mainTabletPadding),
            child: Column(
              children: [
                Flexible(
                  flex: titleFlex,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: titleLeftPadding),
                    child: Column(
                      crossAxisAlignment: crossAxisAlignmentTitle,
                      children: [
                        Spacer(flex: logoTopPadding),
                        Logo(),
                        Spacer(flex: titleTopPadding),
                        Text(title,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color:
                                        Color(SignUpScreenConstants.titleColor),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppConstants.fontApp)),
                        Spacer(flex: titleBottomPadding)
                      ],
                    ),
                  ),
                ),
                if (Device.get().isPhone)
                  (Flexible(
                    flex: formFlex,
                    child: FormSignUp(),
                  ))
                else
                  (Flexible(
                    flex: formFlex,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: FormSignUp(),
                      ),
                    ),
                  )),
                Flexible(
                  flex: formBottomPadding,
                  child: Center(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
