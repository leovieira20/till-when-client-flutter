import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:till_when/ioc.dart';
import 'package:till_when/pages/account/sign_in_page.dart';
import 'package:till_when/pages/homepage.dart';

class AuthenticationChecker extends StatelessWidget {
  static String routeName = '/authenticationChecker';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext c, AsyncSnapshot<User> snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        var user = snapshot.data;

        return user != null ? ioc<MyHomePage>() : ioc<SignInPage>();
      },
    );
  }
}
