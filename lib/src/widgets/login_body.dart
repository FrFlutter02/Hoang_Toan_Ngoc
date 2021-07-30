import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../repositories/user_repository.dart';
import '../constants/constants.dart';

class Login_Body extends StatefulWidget {
  // This widget is the root of your application.
  final double Width;
  final double Height;
  final UserRepository userRepository;

  Login_Body(
      {required this.Width,
      required this.Height,
      required this.userRepository});

  @override
  _Login_BodyState createState() => _Login_BodyState();
}

class _Login_BodyState extends State<Login_Body> {
  final emailController = TextEditingController();

  final passWordController = TextEditingController();

  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 0.025 * widget.Height)),
          Container(
            height: 22,
            width: widget.Width * 0.53,
            padding: EdgeInsets.symmetric(horizontal: 0.0667 * widget.Width),
            child: Text(
              AppLoginScreen.emailRemind,
              style: TextStyle(
                  fontSize: 14, fontFamily: "Nunito", color: Color(0xff606060)),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: widget.Height * 0.046)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.0667 * widget.Width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    AppLoginScreen.emailHint,
                    style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
                        color: Color(0xffA8A8A8)),
                  ),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(),
                    controller: emailController,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: widget.Height * 0.037,
                horizontal: widget.Width * 0.067),
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
                            AppLoginScreen.passwordHint,
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 14,
                                color: Color(0xffA8A8A8)),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/ForgotPasswordScreen');
                              },
                              child: Container(
                                child: Text(
                                  AppLoginScreen.forgotPassword,
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
                          controller: passWordController,
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
            padding: EdgeInsets.symmetric(horizontal: 0.05 * widget.Width),
            child: TextButton(
              onPressed: () async {
                String result = await _userRepository.signInWithCredentials(
                    emailController.text, passWordController.text);
                if (result == "signed in") {
                  User user = await _userRepository.getUser();
                  print(user.email);
                  Navigator.of(context).pushNamed("/Home");
                }
              },
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Color(0xff30BE76),
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  Container(
                      alignment: Alignment.center,
                      child: Text(AppLoginScreen.loginButton,
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
            padding: EdgeInsets.only(top: 0.037 * widget.Height),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      AppLoginScreen.newScracth,
                      style: TextStyle(
                        color: Color(0xffA8A8A8),
                        fontFamily: "Nunito",
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/SignUpScreen');
                      },
                      child: Text(
                        AppLoginScreen.createAccount,
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
