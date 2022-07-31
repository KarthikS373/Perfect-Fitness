import 'package:fitness_monitoring/Screens/LoginSignup/forgotpassword.dart';
import 'package:fitness_monitoring/Utils/Routes/routes.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Services/firebase_auth_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: RichText(
                      text: const TextSpan(
                          text: 'Your',
                          style: TextStyle(
                            fontSize: 32,
                            color: greenTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                        TextSpan(
                            text: ' Fitness partner',
                            style: TextStyle(
                              color: Colors.white54,
                            ))
                      ])),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * .3,
                  child: SvgPicture.asset("assets/SVG/loginIcon.svg"),
                ),
                Container(
                  height: size.height * .3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 20,
                          offset: const Offset(0, 0),
                        )
                      ]),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Positioned(
                        top: 10,
                        left: 25,
                        child: Text(
                          'Login Here',
                          style: TextStyle(
                            color: Colors.black12,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 55,
                        left: 20,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.mail_outline,
                                  color: Colors.grey,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextField(
                                    controller: _emailController,
                                    cursorColor: Colors.grey,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'example@gmail.com',
                                      hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.5),
                                          width: 0.2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 110,
                        left: 20,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.mail_outline,
                                  color: Colors.grey,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  width: 300,
                                  child: TextField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    cursorColor: Colors.grey,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      letterSpacing: 1.4,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '* * * * * * * *',
                                      hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 165,
                        left: 22,
                        child: SizedBox(
                          width: size.width * .8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(RouteManager.signup);
                                },
                                child: const Text(
                                  'Create Account',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const forgotPasswordScreen())),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -20,
                        right: 30,
                        child: GestureDetector(
                          onTap: () {
                            firebaseAuth.loginWithEmail(
                                email: _emailController.text,
                                password: _passwordController.text,
                                context: context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(9),
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  greenTextColor,
                                  greenTextColor,
                                ],
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.chevron_right,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
