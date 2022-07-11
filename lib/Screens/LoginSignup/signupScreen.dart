import 'package:fitness_monitoring/Utils/Routes/routes.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:fitness_monitoring/Widgets/Fields/decorationTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialLoginButton(
                  buttonType: SocialLoginButtonType.google,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RouteManager.detailCollection);
                  },
                  text: "  Google",
                  mode: SocialLoginButtonMode.single,
                ),
                SocialLoginButton(
                  buttonType: SocialLoginButtonType.facebook,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RouteManager.detailCollection);
                  },
                  text: "  Facebook",
                  mode: SocialLoginButtonMode.single,
                ),
              ],
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
                  Navigator.of(context)
                      .pushNamed(RouteManager.detailCollection);
                }
              },
              child: Text(
                "Sign Up",
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        ),
      ),
    );
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
