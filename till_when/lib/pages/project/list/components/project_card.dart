import 'package:flutter/material.dart';
import 'package:till_when/domain/models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final Function onDismissed;
  final Function onTapped;

  const ProjectCard({
    Key key,
    @required this.project,
    @required this.onTapped,
    @required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Card(
        key: ValueKey(project.id),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
          child: Dismissible(
            key: ValueKey(project.id),
            onDismissed: onDismissed,
            child: ListTile(
              title: Text(project.name),
            ),
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete_forever),
            ),
          ),
        ),
      ),
    );
  }
}
