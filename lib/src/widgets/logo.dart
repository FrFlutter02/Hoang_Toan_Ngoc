import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Image.asset(
            "assets/images/logo.png",
            height: 26,
            width: 18,
          ),
        ),
        Text("scratch",
            style: Theme.of(context).textTheme.headline2!.copyWith(
                color: Color(0xff363837),
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
