import 'package:flutter/material.dart';
import 'package:till_when/pages/project/create_project_page.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = '/homepage';

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your projects will be here',
            ),
          ],
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