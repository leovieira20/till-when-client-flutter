import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String> validator;

  TextInput({
    @required this.controller,
    @required this.validator,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
