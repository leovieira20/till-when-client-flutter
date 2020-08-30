import 'package:flutter/material.dart';
import 'package:till_when/domain/models/project.dart';
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
  void initState() {
    widget.vm.fetchProjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projects"),
      ),
      body: Center(
        child: StreamBuilder<List<Project>>(
          stream: widget.vm.projects,
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

            return ReorderableListView(
              children: projects
                  .map(
                    (p) => Card(
                      key: ValueKey(p.id),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                        child: Dismissible(
                          key: ValueKey(p.id),
                          onDismissed: (direction) => widget.vm.deleteProject(p),
                          child: ListTile(
                            title: Text(p.name),
                          ),
                          background: Container(
                            color: Colors.red,
                            child: Icon(Icons.delete_forever),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(
                    growable: false,
                  ),
              onReorder: (oldIx, newIx) {
                if (oldIx < newIx) {
                  newIx -= 1;
                }

                widget.vm.reorderProjects(oldIx, newIx, projects);
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

  Future<void> _navigateToCreateProject() async {
    await Navigator.pushNamed(context, CreateProjectPage.routeName);
    widget.vm.fetchProjects();
  }

  @override
  void dispose() {
    widget.vm.dispose();
    super.dispose();
  }
}
