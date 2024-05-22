import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName  = "Home Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomePage"),),
    );
  }
}
