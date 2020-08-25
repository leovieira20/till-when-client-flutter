import 'package:flutter/material.dart';
import 'package:till_when/pages/homepage.dart';
import 'package:till_when/pages/account/sign_in_page_vm.dart';

class SignInPage extends StatefulWidget {
  static String routeName = '/signIn';

  final SignInPageVm _vm;

  SignInPage(this._vm);

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
            child: RaisedButton(
              onPressed: googleSignIn,
              child: Text("Sign in"),
            ),
          )
        ],
      ),
    );
  }

  Future<void> googleSignIn() async {
    await widget._vm.googleSignIn();
    Navigator.popAndPushNamed(context, MyHomePage.routeName);
  }
}
