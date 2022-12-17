import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_monitoring/Models/profileModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthServices {
  static final _auth = FirebaseAuth.instance;
  static Future<Object?> signIn(
    String email,
    String passwd,
    BuildContext context,
  ) async {
    var isError = false;
    try {
      final responce = await _auth.signInWithEmailAndPassword(
        email: email,
        password: passwd,
      );
      User? user = responce.user;
      print(user);
      return user;

    } catch (err) {
      print(err);
      isError = true;
      String message = "Something went wrong...";
      if (err is FirebaseException || err is FirebaseAuthException) {
        message = (err as FirebaseException).message.toString();
      } else if (err is PlatformException) {
        message = (err).message.toString();
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:  Text(
            message,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: isError ? Colors.red : Colors.green,
        ),
      );
      return err;
    }
  }
}
