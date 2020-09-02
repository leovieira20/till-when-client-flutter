import 'package:flutter/material.dart';
import 'package:till_when/pages/project/create/components/text_input.dart';

class NumOfTasksInput extends StatelessWidget {
  final TextEditingController controller;

  const NumOfTasksInput({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextInput(
      controller: controller,
      hintText: "1",
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }

        if (num.parse(value) < 1) {
          return 'Your project should have at least one task';
        }

        return null;
      },
    );
  }
}
