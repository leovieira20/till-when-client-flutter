import 'package:flutter/material.dart';
import 'package:till_when/ioc.dart';
import 'package:till_when/pages/authentication_checker.dart';
import 'package:till_when/pages/account/sign_in_page.dart';
import 'package:till_when/pages/project/create/create_project_page.dart';
import 'package:till_when/pages/project/list/list_project_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    AuthenticationChecker.routeName: (context) => ioc<AuthenticationChecker>(),
    ListProjectPage.routeName: (context) => ioc<ListProjectPage>(),
    SignInPage.routeName: (context) => ioc<SignInPage>(),
    CreateProjectPage.routeName: (context) => ioc<CreateProjectPage>(),
  };
}
