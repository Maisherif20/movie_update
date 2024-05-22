import 'package:flutter/material.dart';
import 'package:untitled/data_layer/firebase/firebaseAuth.dart';
import 'package:untitled/presentation_layer/ui/homePage.dart';
import 'package:untitled/presentation_layer/ui/widgets/CustomTextFormField.dart';

import 'core/checkEmail.dart';

class LoginScreen extends StatefulWidget {
  static const routeName  = "Login Screen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController passwordController;
  late TextEditingController emailController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    passwordController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.clear();
    emailController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Sign in",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "Welcome Back👋",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                CustomTextFormField(
                  controller: emailController,
                  labeltext: "Enter your email",
                  validation: (input) {
                    if (input == null || input.isEmpty) {
                      return "Please Enter your email";
                    }
                    bool isValid = EmailCheck.isEmail(input);
                    if (isValid == false) {
                      return "Please enter valid email";
                    }
                  },
                ),
                CustomTextFormField(
                  controller: passwordController,
                  labeltext: "Enter your password",
                  validation: (input) {
                    if (input == null || input.isEmpty) {
                      return "Please Enter your password";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        backgroundColor: Colors.black),
                    onPressed: () {
                      login();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
     FirebaseAuthUser.login(emailController.text, passwordController.text , context);
  }
}
