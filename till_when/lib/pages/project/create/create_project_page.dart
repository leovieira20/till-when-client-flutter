import 'package:flutter/material.dart';
import 'package:till_when/pages/project/create/components/name_of_tasks_input.dart';
import 'package:till_when/pages/project/create/components/num_of_tasks_input.dart';
import 'package:till_when/pages/project/create/components/project_name_input.dart';
import 'package:till_when/pages/project/create/components/submit_button.dart';
import 'package:till_when/pages/project/create/create_project_page_vm.dart';
import 'package:till_when/pages/sizing_constants.dart';

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
        padding: const EdgeInsets.symmetric(vertical: kVerticalPadding, horizontal: kHorizontalPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProjectNameInput(controller: _nameController),
              SizedBox(height: kMediumVerticalGap),
              Text(
                "Tasks",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: kSmallVerticalGap),
              Row(
                children: [
                  Text(
                    "Num of tasks:",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(width: kSmallVerticalGap),
                  SizedBox(
                    width: kLargeHorizontalGap,
                    child: NumOfTasksInput(controller: _numOfTasksController),
                  ),
                  SizedBox(width: kSmallVerticalGap),
                  Text(
                    "Name of tasks:",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(width: kSmallHorizontalGap),
                  Expanded(child: NameOfTasksInput(controller: _nameOfTasksController)),
                ],
              ),
              SizedBox(height: kMediumVerticalGap),
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
    if (!_formKey.currentState!.validate()) {
      return;
    }

    var name = _nameController.text;
    var numOfTasks = int.parse(_numOfTasksController.text);
    var nameOfTasks = _nameOfTasksController.text;

    await widget.vm.createProject(name, numOfTasks, nameOfTasks);

    Navigator.pop(context);
  }
}
