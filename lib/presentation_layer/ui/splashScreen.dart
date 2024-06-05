import 'package:flutter/material.dart';
import 'helpers/saveUserLogin.dart';
import 'homeScreen/homeScreen.dart';
import 'loginScreen.dart';
class SplashScreen extends StatefulWidget {
  static String routeName = "splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();

    // Navigate after animation completes
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, SaveUserLogin.getId().isNotEmpty?HomeScreen.routeName:LoginScreen.routeName);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Opacity(
            opacity: animation.value,
            child: Image.asset(
              "assests/images/movieLogo.png", // Corrected the asset path
              fit: BoxFit.none,
            ),
          ),
        );
      },
    );
  }
}