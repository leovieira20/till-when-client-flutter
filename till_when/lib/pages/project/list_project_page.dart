import 'package:flutter/material.dart';
import 'package:till_when/domain/model/project.dart';
import 'package:till_when/pages/project/create_project_page.dart';
import 'package:till_when/pages/project/list_project_page_vm.dart';

class ListProjectPage extends StatefulWidget {
  static String routeName = '/listProject';

  final ListProjectPageVm vm;

  ListProjectPage(this.vm, {Key key}) : super(key: key);

  @override
  _ListProjectPageState createState() => _ListProjectPageState();
}

class _ListProjectPageState extends State<ListProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projects"),
      ),
      body: Center(
        child: StreamBuilder<List<Project>>(
          stream: widget.vm.getProjects(),
          builder: (BuildContext context, AsyncSnapshot<List<Project>> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            var projects = snapshot.data;

            if (projects.isEmpty) {
              return Text(
                'Your projects will be here',
              );
            }

            return ListView.builder(
              itemCount: projects.length,
              itemBuilder: (c, ix) {
                var p = projects[ix];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                    child: ListTile(
                      title: Text(p.name),
                      trailing: PopupMenuButton(
                        child: Icon(Icons.more_vert),
                        itemBuilder: (c) {
                          return [
                            PopupMenuItem(
                              child: Text("Remove"),
                              value: "remove",
                            )
                          ];
                        },
                        onSelected: (value) => widget.vm.deleteProject(p),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCreateProject,
        tooltip: 'Create Project',
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToCreateProject() {
    Navigator.pushNamed(context, CreateProjectPage.routeName);
  }
}
