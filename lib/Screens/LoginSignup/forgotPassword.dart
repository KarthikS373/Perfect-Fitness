import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_monitoring/Screens/HomeScreen/HomeScreen.dart';
import 'package:fitness_monitoring/Utils/showSnackbar.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class forgotPasswordScreen extends StatefulWidget {
  const forgotPasswordScreen({Key? key}) : super(key: key);
  @override
  State<forgotPasswordScreen> createState() => _forgotPasswordScreen();
}

// ignore: camel_case_types
class _forgotPasswordScreen extends State<forgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //Firebase Call
  String? errorMessage;
  String? userEmail = "";
  String? userImageURL;
  String? userName = "Login";
  bool signedOut = true;
  bool signedIn = false;

  @override
  Widget build(BuildContext context) {
    //EMAIL FIELD
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Email cannot be empty");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final resetButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 255, 99, 71),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          resetPassword(emailController.text);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomeScreen() ));
        },
        child: const Text(
          "Send Request",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: const Text(
          "Forgot password",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.black54,
      body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 200,
                        child : CircleAvatar(
                          radius:110,
                          backgroundImage: AssetImage('assets/Images/fit.jpg'),
                        ),
                      ),
                      const SizedBox(height: 45),
                      emailField,
                      const SizedBox(height: 65),
                      resetButton,
                      const SizedBox(height: 130),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "By Continuing you agree to the Terms of\n      Services and Privacy Policy.",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Future resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showSnackBar(context, "Password reset link sent!");
    } catch (e) {
      showSnackBar(context,"Try again!");
    }
  }
}