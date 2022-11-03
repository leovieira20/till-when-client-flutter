import 'package:flutter/material.dart';
import 'package:till_when/pages/account/sign_in_page_vm.dart';
import 'package:till_when/pages/project/list/list_project_page.dart';

class SignInPage extends StatefulWidget {
  static String routeName = '/signIn';

  final SignInPageVm vm;

  SignInPage(this.vm);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TillWhen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: googleSignIn,
              child: Text("Sign in"),
            ),
          )
        ],
      ),
    );
  }

  Future<void> googleSignIn() async {
    var user = await widget.vm.googleSignIn();
    if (user != null) {
      Navigator.popAndPushNamed(context, ListProjectPage.routeName);
    }
  }
}
