import 'package:get_it/get_it.dart';
import 'package:till_when/firebase_init.dart';
import 'package:till_when/my_app.dart';
import 'package:till_when/pages/homepage.dart';
import 'package:till_when/pages/sign_in_page.dart';

GetIt ioc = GetIt.instance;

void setupIoc() {
  ioc.registerFactory(() => FirebaseInit());
  ioc.registerFactory(() => MyApp());

  ioc.registerFactory(() => MyHomePage(title: "something",));
  ioc.registerFactory(() => SignInPage());
}