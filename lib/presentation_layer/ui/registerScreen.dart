import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/data_layer/firebase/firebaseAuth.dart';
import 'package:untitled/presentation_layer/ui/widgets/CustomTextFormField.dart';

import 'core/checkEmail.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName  = "register Screen";
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController fullNameController;
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  late TextEditingController emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    fullNameController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.clear();
    userNameController.clear();
    passwordController.clear();
    passwordConfirmationController.clear();
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
                  "Sign up",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "Welcome 👋",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                CustomTextFormField(
                  controller: fullNameController,
                  labeltext: "Enter your full name:",
                  validation: (input) {
                    if (input == null || input.isEmpty) {
                      return "Please Enter your full name";
                    }
                  },
                ),
                CustomTextFormField(
                  controller: userNameController,
                  labeltext: "Enter your user name",
                  validation: (input) {
                    if (input == null || input.isEmpty) {
                      return "Please Enter your user name";
                    }
                  },
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
                    if (input.length < 10) {
                      return "Password must contain 9 numbers";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  controller: passwordConfirmationController,
                  labeltext: "Enter your password confirmation",
                  validation: (input) {
                    if (input == null || input.isEmpty) {
                      return "Please renter password ";
                    }
                    if (input != passwordConfirmationController.text) {
                      return "Password Confirmation must match password ";
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
                      createAccount();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
                Text("Already have account.", style:  TextStyle(),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createAccount() async {
    var authProvider = Provider.of<FirebaseAuthUser>(context, listen: false);
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    await authProvider.register(
        emailController.text, passwordController.text, context);
  }
}
