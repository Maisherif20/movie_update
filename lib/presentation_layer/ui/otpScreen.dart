import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/presentation_layer/ui/homeScreen/homeScreen.dart';
import 'package:untitled/presentation_layer/ui/widgets/customTextField.dart';
import 'package:telephony/telephony.dart';
class OtpCodeScreen extends StatefulWidget {
  String verificationId;
  OtpCodeScreen({required this.verificationId});
  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  final Telephony telephony = Telephony.instance;
  String textReceived="";
  void startListen(){
    print("listen");
    telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          // Handle message
          print("sms received: ${message.body}");
          if(message.body!.contains("movie-update-babd8"))
            {
              String otpCode=message.body!.substring(0,6);
              setState(() {
                otpCodeController.text=otpCode;
              });
            }

        },
        listenInBackground: false
    );
  }
  late TextEditingController otpCodeController;
  @override
  void initState() {
    otpCodeController = TextEditingController();
    super.initState();
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Auth by Phone $textReceived"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(controller: otpCodeController, text: "Enter otp code:", validator: (input){
              if(input==null || input.isEmpty)
                {
                  return "please enter code";
                }
              if(input.length < 5)
                {
                  return "Code must be 6 numbers";
                }

            }),
            ElevatedButton(
                onPressed: ()  {
                  otpCodeDone();
                },
                child: Text("Done")),
          ],
        ),
      ),
    );
  }
  void otpCodeDone()async{
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    try {
      PhoneAuthCredential credential =
          await PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: otpCodeController.text.toString());
      FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } catch (ex) {
      print(ex);
    }
  }

}
