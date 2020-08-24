import 'package:flutter/material.dart';
import 'package:till_when/ioc.dart';
import 'package:till_when/pages/homepage.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    "/": (context) => ioc<MyHomePage>()
  };
}