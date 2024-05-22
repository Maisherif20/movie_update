import 'package:flutter/material.dart';
typedef Validation = String? Function(String?);
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String text;
  Validation validator;
  CustomTextField({required this.controller , required this.text, required this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: TextInputType.phone,
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white , width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white , width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        errorStyle: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),
        fillColor: Colors.white,
          filled: true,
      ),

    );
  }
}
