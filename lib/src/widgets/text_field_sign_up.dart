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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Color(SignUpScreenConstants.lableColor),
                fontSize: 14,
                fontWeight: FontWeight.w400)),
        TextField(),
      ],
    );
  }
}
