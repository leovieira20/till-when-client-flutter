import 'package:flutter/material.dart';
import 'package:till_when/ioc.dart';
import 'package:till_when/pages/authentication_checker.dart';
import 'package:till_when/pages/homepage.dart';
import 'package:till_when/pages/project/create_project_page.dart';
import 'package:till_when/pages/account/sign_in_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    AuthenticationChecker.routeName: (context) => ioc<AuthenticationChecker>(),
    MyHomePage.routeName: (context) => ioc<MyHomePage>(),
    SignInPage.routeName: (context) => ioc<SignInPage>(),
    CreateProjectPage.routeName: (context) => ioc<CreateProjectPage>(),
  };
}
