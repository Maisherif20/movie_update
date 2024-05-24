import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data_layer/firebase/fiebaseErrorCode.dart';
import 'package:untitled/presentation_layer/ui/homeScreen/homeScreen.dart';
import 'package:untitled/presentation_layer/ui/loginScreen.dart';

class FirebaseAuthUser {
  static void register(String email, String password, BuildContext context) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);

      print(credential.user?.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrorCode.weakPassword) {
        print('The password provided is too weak.');
      } else if (e.code == FirebaseErrorCode.emailAlreadyInUse) {
        print('The account already exists for that email.');
      }
    }
  }

  static void login(String email, String password , BuildContext context) async {
    try {
      var credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(credential.user?.uid);
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } on FirebaseAuthException catch (e) {
      print("error");
      if (e.code == FirebaseErrorCode.userNotFound) {
        print('No user found for that email.');
      } else if (e.code == FirebaseErrorCode.wrongPassword) {
        print('Wrong password provided for that user.');
      }
    }
    catch(e)
    {
      print(e.toString());
    }
  }
}
