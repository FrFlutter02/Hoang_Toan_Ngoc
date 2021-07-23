import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile_app/src/constants/constant.dart';

class Login_Screen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;
    final double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: maxWidth,
                      height: maxHeight * 0.35,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(loginImage),
                        fit: BoxFit.fill,
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: maxHeight * 0.074),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 0.067 * maxWidth),
                            child: Row(
                              children: [
                                Container(
                                  width: 18,
                                  height: 26,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(logo))),
                                ),
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Container(
                                  width: 70,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(textLogo))),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: maxHeight * 0.07)),
                          Container(
                              padding: EdgeInsets.only(left: 0.067 * maxWidth),
                              width: maxWidth * 0.811,
                              child: Text(
                                "Welcome Back!",
                                style: TextStyle(
                                    fontSize: 24, fontFamily: "Nunito"),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 0.025 * maxHeight)),
                Container(
                  padding: EdgeInsets.only(left: 0.067 * maxWidth),
                  height: 22,
                  width: maxWidth * 0.53,
                  child: Text(
                    "Please login to continue",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Nunito",
                        color: HexColor("#606060")),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: maxHeight * 0.046)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.0667 * maxWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Email address",
                          style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 14,
                              color: Color(0xffA8A8A8)),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: maxHeight * 0.037,
                      horizontal: maxWidth * 0.067),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 14,
                                      color: Color(0xffA8A8A8)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 0.07 * maxHeight,
                  padding: EdgeInsets.symmetric(horizontal: 0.05 * maxWidth),
                  child: TextButton(
                    onPressed: () {},
                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Color(0xff30BE76),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        Container(
                            alignment: Alignment.center,
                            child: Text("Login",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white))),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 0.037 * maxHeight, left: maxWidth * 0.275),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "New to Scratch?",
                          style: TextStyle(
                            color: Color(0xffA8A8A8),
                            fontFamily: "Nunito",
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Create Account Here",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 16,
                                letterSpacing: 0.32,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff30BE76)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 0.64 * maxWidth, top: 0.57 * maxHeight),
              child: TextButton(
                  onPressed: () {},
                  child: Container(
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 14,
                          color: Color(0xff606060)),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
