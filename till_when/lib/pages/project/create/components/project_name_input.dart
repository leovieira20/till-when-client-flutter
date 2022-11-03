import 'package:flutter/material.dart';
import 'package:till_when/pages/project/create/components/text_input.dart';

class ProjectNameInput extends StatelessWidget {
  final TextEditingController controller;

  const ProjectNameInput({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextInput(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      hintText: "Project name",
    );
  }
}
