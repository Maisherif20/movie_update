import 'package:flutter/material.dart';
typedef Validation = String? Function(String?);
class CustomTextFormField extends StatelessWidget {
  Validation validation;
  String labeltext;
  TextEditingController controller;
  CustomTextFormField({required this.labeltext , required this.validation , required this.controller });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller:controller ,
        validator: validation,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          // hintText: text,
          labelText: labeltext,
          labelStyle: TextStyle(color: Colors.black)
        ),
      ),
    );
  }
}
