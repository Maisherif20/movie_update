import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:telephony/telephony.dart';
import 'package:untitled/presentation_layer/ui/homeScreen/homeScreen.dart';
import 'package:untitled/presentation_layer/ui/otpScreen.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:untitled/presentation_layer/ui/widgets/customTextField.dart';

class AuthByPhoneScreen extends StatefulWidget {
  @override
  State<AuthByPhoneScreen> createState() => _AuthByPhoneScreenState();
}

class _AuthByPhoneScreenState extends State<AuthByPhoneScreen> {
  late TextEditingController phoneController;
  late TextEditingController otpCodeController;
  String verification = "";
  final Telephony telephony = Telephony.instance;

  @override
  void initState() {
    otpCodeController=TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  void submit() async {
    var appSignatureID = await SmsAutoFill().getAppSignature;
    Map sendOtpData = {
      "mobile_number": phoneController.text,
      "app_signature_id": appSignatureID
    };
    print(sendOtpData);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const VerifyOTPScreen()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("Sign up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Welcome to our app",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: phoneController,
                  text: "Enter your phone number:",
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return "Please enter your phone number to sign up";
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      submit();
                      authByPhone();
                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void authByPhone() async {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {},
        codeSent: (String verificationId, int? resendToken) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  title: const Text('Enter code'),
                  content:    CustomTextField(
                   controller: otpCodeController,
                   text: "Enter otp code:",
                   validator: (input) {
                   if (input == null || input.isEmpty) {
                   return "please enter code";
                   }
                   if (input.length < 5) {
                   return "Code must be 6 numbers";
                   }}),
                  actions: [
                    TextButton(
                      onPressed: () {
                        otpCodeDone(verificationId);
                      },
                      child: const Text('Submit' , style: TextStyle(color: Colors.black , fontSize: 15),),
                    ),
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: phoneController.text.toString());
  }

  void otpCodeDone(String verificationId) async {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    try {
      PhoneAuthCredential credential = await PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: otpCodeController.text.toString());
      FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } catch (ex) {
      print(ex);
    }
  }

}
