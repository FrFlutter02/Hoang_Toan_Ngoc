import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile_app/src/constants/constant.dart';

class Login_Body extends StatelessWidget {
  // This widget is the root of your application.
  final double Width;
  final double Height;
  Login_Body({required this.Width, required this.Height});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 0.025 * Height)),
          Container(
            height: 22,
            width: Width * 0.53,
            padding: EdgeInsets.symmetric(horizontal: 0.0667 * Width),
            child: Text(
              "Please login to continue",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Nunito",
                  color: HexColor("#606060")),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: Height * 0.046)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.0667 * Width),
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
                vertical: Height * 0.037, horizontal: Width * 0.067),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 14,
                                color: Color(0xffA8A8A8)),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Container(
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 14,
                                      color: Color(0xff606060)),
                                ),
                              ))
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 25),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(),
                        ),
                      ),
                    ]),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: (70),
            padding: EdgeInsets.symmetric(horizontal: 0.05 * Width),
            child: TextButton(
              onPressed: () {},
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Color(0xff30BE76),
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
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
            padding: EdgeInsets.only(top: 0.037 * Height),
            child: Center(
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
            ),
          )
        ],
      ),
    );
  }
}
