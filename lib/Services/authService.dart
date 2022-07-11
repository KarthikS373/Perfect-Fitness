import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthServices {
  static void SignIn(
    String userName,
    String email,
    String passwd,
    BuildContext context,
  ) async {
    final _auth = FirebaseAuth.instance;

    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: passwd);
      
    } catch (err) {
      String message = "Something went wrong...";
      if (err is FirebaseException || err is FirebaseAuthException) {
        message = (err as FirebaseException).message.toString();
      } else if (err is PlatformException) {
        message = (err).message.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }
}
