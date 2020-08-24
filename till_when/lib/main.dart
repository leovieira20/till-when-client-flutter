import 'package:flutter/material.dart';
import 'package:till_when/firebase_init.dart';
import 'package:till_when/ioc.dart';

void main() {
  setupIoc();
  runApp(ioc<FirebaseInit>());
}