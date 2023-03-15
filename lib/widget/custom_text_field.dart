import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
       decoration: InputDecoration(
         labelText: labelText
       ),
    );
  }
}
