
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_monitoring/Screens/HomeScreen/HomeScreen.dart';
import 'package:fitness_monitoring/Utils/Routes/routes.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:fitness_monitoring/Widgets/Fields/decorationTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../Services/firebase_auth_methods.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 69,
            ),
            Image.asset(
              "assets/Images/Logo.png",
              width: 130,
            ),
            const SizedBox(
              height: 10,
              width: double.infinity,
            ),
            const _SignUpForm(),
            const SizedBox(
              height: 10,
            ),
            Text(
              "OR",
              style: GoogleFonts.aBeeZee(
                color: Colors.grey,
                fontSize: 18,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
              indent: 40,
              endIndent: 40,
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

String passwd = "";

class _SignUpForm extends StatefulWidget {
  const _SignUpForm({Key? key}) : super(key: key);

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  final _key = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _passwd = TextEditingController();
  final _cpasswd = TextEditingController();

  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  String? userEmail = "";
  String? userImageURL;
  String? userName = "Login";
  bool signedOut = true;
  bool signedIn = false;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              controller: _name,
              cursorColor: textColor,
              autocorrect: true,
              decoration: textDeco("Name"),
              validator: MultiValidator(
                [
                  RequiredValidator(
                    errorText: "Required",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _email,
              cursorColor: textColor,
              autocorrect: true,
              decoration: textDeco("Email"),
              validator: MultiValidator(
                [
                  RequiredValidator(
                    errorText: "Required",
                  ),
                  EmailValidator(
                    errorText: "Enter a valid email",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwd,
              onChanged: (_) {
                passwd = _passwd.text;
              },
              obscureText: true,
              obscuringCharacter: "*",
              cursorColor: textColor,
              autocorrect: false,
              decoration: textDeco("Password"),
              validator: MultiValidator(
                [
                  RequiredValidator(
                    errorText: "Required",
                  ),
                  MinLengthValidator(
                    8,
                    errorText: "Password must be 8 chara long",
                  ),
                  MaxLengthValidator(
                    35,
                    errorText: "Password must be less than 35 characters",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _cpasswd,
              obscureText: true,
              obscuringCharacter: "*",
              autocorrect: false,
              cursorColor: textColor,
              decoration: textDeco("Confirm Password"),
              validator: MultiValidator(
                [
                  RequiredValidator(
                    errorText: "Required",
                  ),
                  ConfirmPasswdValidator(
                    errorText: "Passwords does not match",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                primary: secondaryColor,
                splashFactory: InkSplash.splashFactory,
              ),
              onPressed: () {
                if (_key.currentState!.validate()) {
                  _key.currentState!.save();
                  firebaseAuth.signUpWithEmail(email: _email.text, password: _passwd.text, context: context);
                  Navigator.of(context)
                      .pushNamed(RouteManager.detailCollection);
                }
              },
              child: Text(
                "Sign Up",
                style: GoogleFonts.poppins(),
              ),
            ),

          //  start
            const SizedBox(height: 25),
            Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    if (!signedIn) {
                      await signInWithGoogle();
                      setState(() {
                        signedOut = false;
                        signedIn = true;
                      });
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    }
                  },
                  style: ButtonStyle(
                      minimumSize:
                      MaterialStateProperty.all(const Size(300, 50)),
                      backgroundColor:
                      MaterialStateProperty.all(Colors.white),
                      foregroundColor:
                      MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.white)))),
                  icon: const FaIcon(FontAwesomeIcons.google,
                      color: Colors.red),
                  label: const Text('Login with Google'),
                )),

          //  end

          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    userEmail = googleUser?.email;
    userImageURL = googleUser?.photoUrl;
    // print(userImageURL);
    setState(() {
      userName = googleUser?.displayName;
    });

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}


class ConfirmPasswdValidator extends TextFieldValidator {
  ConfirmPasswdValidator({String errorText = "Password is not matching"})
      : super(errorText);

  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String? value) {
    if (passwd == value) {
      return true;
    } else {
      return false;
    }
  }
}



