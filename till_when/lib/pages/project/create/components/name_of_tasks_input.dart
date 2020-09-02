import 'package:flutter/material.dart';
import 'package:till_when/pages/project/create/components/text_input.dart';

class NameOfTasksInput extends StatelessWidget {
  final TextEditingController controller;

  const NameOfTasksInput({
    Key key,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextInput(
      controller: controller,
      hintText: "ex: Chapter",
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }

        return null;
      },
    );
  }
}