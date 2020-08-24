import 'package:get_it/get_it.dart';
import 'package:till_when/domain/repositories/project_repository.dart';
import 'package:till_when/domain/repositories/user_repository.dart';
import 'package:till_when/firebase_init.dart';
import 'package:till_when/my_app.dart';
import 'package:till_when/pages/homepage.dart';
import 'package:till_when/pages/project/create_project_page.dart';
import 'package:till_when/pages/project/create_project_page_vm.dart';
import 'package:till_when/pages/sign_in_page.dart';

GetIt ioc = GetIt.instance;

void setupIoc() {
  ioc.registerFactory(() => FirebaseInit());
  ioc.registerFactory(() => MyApp());

  ioc.registerFactory(() => UserRepository());
  ioc.registerFactory(() => ProjectRepository(ioc<UserRepository>()));

  ioc.registerFactory(() => CreateProjectPageVm(ioc<ProjectRepository>()));

  ioc.registerFactory(() => MyHomePage(title: "something",));
  ioc.registerFactory(() => SignInPage());
  ioc.registerFactory(() => CreateProjectPage(ioc<CreateProjectPageVm>()));
}