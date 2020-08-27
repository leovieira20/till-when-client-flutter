import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:till_when/ioc.dart';
import 'package:till_when/pages/account/sign_in_page.dart';
import 'package:till_when/pages/project/list_project_page.dart';

class AuthenticationChecker extends StatefulWidget {
  static String routeName = '/authenticationChecker';

  final AuthenticationCheckerVm vm;

  AuthenticationChecker(this.vm);

  @override
  _AuthenticationCheckerState createState() => _AuthenticationCheckerState();
}

class _AuthenticationCheckerState extends State<AuthenticationChecker> {
  @override
  void initState() {
    widget.vm.getCurrentUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.vm.currentUSer,
      builder: (BuildContext c, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var user = snapshot.data;

        return user != null ? ioc<ListProjectPage>() : ioc<SignInPage>();
      },
    );
  }
}

class AuthenticationCheckerVm {
  var _currentUser = StreamController<User>();

  void getCurrentUser() {
    _currentUser.sink.add(FirebaseAuth.instance.currentUser);
  }

  void dispose() {
    _currentUser.close();
  }

  Stream<User> get currentUSer => _currentUser.stream;
}
