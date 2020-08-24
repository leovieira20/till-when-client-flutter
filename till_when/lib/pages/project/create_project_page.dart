import 'package:flutter/material.dart';
import 'package:till_when/pages/project/create_project_page_vm.dart';

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
      appBar: AppBar(title: Text("Create Project"),),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Project name',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    var name = _nameController.text;

                    widget.vm.createProject(name);
                  }
                },
                child: Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}