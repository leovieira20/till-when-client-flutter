import 'package:flutter/material.dart';
import 'package:till_when/ioc.dart';
import 'package:till_when/pages/homepage.dart';
import 'package:till_when/pages/sign_in_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    MyHomePage.routeName: (context) => ioc<MyHomePage>(),
    SignInPage.routeName: (context) => ioc<SignInPage>(),
  };
}
