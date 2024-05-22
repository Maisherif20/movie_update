import 'package:flutter/material.dart';
import 'package:untitled/presentation_layer/ui/authNyPhone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/presentation_layer/ui/homePage.dart';
import 'package:untitled/presentation_layer/ui/loginScreen.dart';
import 'package:untitled/presentation_layer/ui/login_Page.dart';
import 'package:untitled/presentation_layer/ui/registerScreen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.routeName :(context)=> LoginScreen(),
        RegisterScreen.routeName :(context)=>RegisterScreen(),
        HomePage.routeName:(context)=>HomePage(),

      },
      initialRoute:LoginScreen.routeName,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: false,
      ),
    );
  }
}


