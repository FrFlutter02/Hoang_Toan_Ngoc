import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    MainAxisAlignment mainAxisAlignment;
    if (deviceWidth < 600) {
      mainAxisAlignment = MainAxisAlignment.start;
    } else {
      mainAxisAlignment = MainAxisAlignment.center;
    }
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Image.asset(
            AppConstants.imageLogoPath,
            height: 26,
            width: 18,
          ),
        ),
        Text(AppConstants.nameApp,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Color(AppConstants.logoTextColor),
                fontWeight: FontWeight.bold,
                letterSpacing: 0.4,
                height: 1)),
      ],
    );
  }
}
