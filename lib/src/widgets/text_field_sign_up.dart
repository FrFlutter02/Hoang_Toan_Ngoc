import 'package:flutter/material.dart';
import '../constants/constants.dart';

class TextFiedSignUp extends StatelessWidget {
  const TextFiedSignUp({
    Key? key,
    required this.lable,
  }) : super(key: key);
  final String lable;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(lable,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Color(SignUpScreenConstants.lableColor),
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            if (deviceWidth >= 600 &&
                lable == SignUpScreenConstants.passwordText)
              (TextButton(
                  onPressed: () {},
                  child: Text(
                    SignUpScreenConstants.forgotpasswordText,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14,
                        color: Color(0xff606060),
                        fontWeight: FontWeight.normal),
                  )))
          ],
        ),
        if (lable == SignUpScreenConstants.passwordText)
          (TextField(
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 13, bottom: 5),
              isDense: true,
            ),
          ))
        else
          (TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 13, bottom: 5),
              isDense: true,
            ),
          ))
      ],
    );
  }
}
