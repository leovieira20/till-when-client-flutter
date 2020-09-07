import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:till_when/domain/models/project.dart';
import 'package:till_when/pages/project/detail/detail_project_page_vm.dart';
import 'package:till_when/pages/sizing_constants.dart';

class DetailProjectPage extends StatelessWidget {
  static var routeName = '/detailProjectPage';

  final DetailProjectPageVm vm;

  const DetailProjectPage(this.vm, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Project p = ModalRoute.of(context).settings.arguments;
    vm.getTasks(p.id);

    return Scaffold(
      appBar: AppBar(
        title: Text("Project detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kVerticalPadding,
          horizontal: kHorizontalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                p.name,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SizedBox(
              height: kMediumVerticalGap,
            ),
            Text(
              "Tasks",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: kMediumVerticalGap,
            ),
            Observer(builder: (_) {
              var tasks = vm.tasks;

              if (tasks == null) {
                return Center(child: CircularProgressIndicator());
              }

              if (tasks.isEmpty) {
                return Center(child: Text("Why don't you create some tasks?"));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (c, ix) {
                    var t = tasks[ix];

                    return Card(
                      child: ListTile(
                        title: Text(t.title),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
