import 'package:flutter/material.dart';
import 'package:till_when/pages/project/create/components/project_name_input.dart';
import 'package:till_when/pages/project/create/components/submit_button.dart';
import 'package:till_when/pages/project/create/create_project_page_vm.dart';

class CreateProjectPage extends StatefulWidget {
  static String routeName = '/createProject';

  final CreateProjectPageVm vm;

  CreateProjectPage(this.vm);

  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Project"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProjectNameInput(
                controller: _nameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                hintText: "Project name",
              ),
              SubmitButton(
                onPressed: _createProject,
                isBusyController: widget.vm.isBusy,
                label: "Create",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createProject() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    var name = _nameController.text;

    await widget.vm.createProject(name);
    Navigator.pop(context);
  }
}
