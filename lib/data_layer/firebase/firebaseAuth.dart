import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data_layer/Models/account/user.dart' as myuser;
import 'package:untitled/data_layer/firebase/fiebaseErrorCode.dart';
import 'package:untitled/data_layer/firebase/firestore_user.dart';
import 'package:untitled/presentation_layer/ui/homeScreen/homeScreen.dart';
import 'package:untitled/presentation_layer/ui/loginScreen.dart';

class FirebaseAuthUser extends ChangeNotifier {
  myuser.User? databaseUser;
  User? firebaseAuthUser;

  Future<void>register(String email, String password, BuildContext context) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      print(credential.user?.uid);
      await UserDao.addUser(myuser.User(
        id: credential.user?.uid,
        email: email,
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrorCode.weakPassword) {
        print('The password provided is too weak.');
      } else if (e.code == FirebaseErrorCode.emailAlreadyInUse) {
        print('The account already exists for that email.');
      }
    }
  }

  Future<void>login(String email, String password, BuildContext context) async {
    try {
      var credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(credential.user?.uid);
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);

      var user = await UserDao.getUser(credential.user!.uid);
      databaseUser = user;
      firebaseAuthUser = credential.user;
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
