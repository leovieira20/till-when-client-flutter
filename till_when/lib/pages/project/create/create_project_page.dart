import 'package:flutter/material.dart';
import 'package:till_when/pages/project/create/components/name_of_tasks_input.dart';
import 'package:till_when/pages/project/create/components/num_of_tasks_input.dart';
import 'package:till_when/pages/project/create/components/project_name_input.dart';
import 'package:till_when/pages/project/create/components/text_input.dart';
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
  final _numOfTasksController = TextEditingController();
  final _nameOfTasksController = TextEditingController();

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
              ProjectNameInput(controller: _nameController),
              SizedBox(height: 20),
              Text(
                "Tasks",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Num of tasks:",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 30,
                    child: NumOfTasksInput(controller: _numOfTasksController),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Name of tasks:",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(width: 10),
                  Expanded(child: NameOfTasksInput(controller: _nameOfTasksController)),
                ],
              ),
              SizedBox(height: 20),
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
    var numOfTasks = num.parse(_numOfTasksController.text);
    var nameOfTasks = _nameOfTasksController.text;

    await widget.vm.createProject(name, numOfTasks, nameOfTasks);

    Navigator.pop(context);
  }
}
