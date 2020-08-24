import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:till_when/ioc.dart';
import 'package:till_when/my_app.dart';

class FirebaseInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          throw Error();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return ioc<MyApp>();
        }

        return CircularProgressIndicator();
      },
    );
  }
}