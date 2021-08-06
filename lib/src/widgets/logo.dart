import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:mobile_app/src/constants/constants.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
    if (Device.get().isPhone) {
      mainAxisAlignment = MainAxisAlignment.start;
    } else {
      mainAxisAlignment = MainAxisAlignment.center;
    }
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Image.asset(AppLoginScreen.logo,
              height: 26, width: 18, key: Key("logoIcon")),
        ),
        Text(AppLoginScreen.logoText,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Color(AppLoginScreen.logoTextColor),
                fontFamily: AppFonts.fontAppRegular,
                letterSpacing: 0.4,
                height: 1)),
      ],
    );
  }
}
