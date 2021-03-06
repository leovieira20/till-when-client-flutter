import 'package:get_it/get_it.dart';
import 'package:till_when/domain/factories/project_factory.dart';
import 'package:till_when/domain/repositories/project_repository.dart';
import 'package:till_when/domain/repositories/task_repository.dart';
import 'package:till_when/domain/services/google_sign_in_service.dart';
import 'package:till_when/firebase_init.dart';
import 'package:till_when/my_app.dart';
import 'package:till_when/pages/authentication_checker.dart';
import 'package:till_when/pages/account/sign_in_page.dart';
import 'package:till_when/pages/account/sign_in_page_vm.dart';
import 'package:till_when/pages/project/create/create_project_page.dart';
import 'package:till_when/pages/project/create/create_project_page_vm.dart';
import 'package:till_when/pages/project/detail/detail_project_page.dart';
import 'package:till_when/pages/project/detail/detail_project_page_vm.dart';
import 'package:till_when/pages/project/list/list_project_page.dart';
import 'package:till_when/pages/project/list/list_project_page_vm.dart';
import 'pages/authentication_checker.dart';

GetIt ioc = GetIt.instance;

void setupIoc() {
  ioc.registerFactory(() => FirebaseInit());
  ioc.registerFactory(() => MyApp());

  ioc.registerFactory(() => ProjectRepository());
  ioc.registerFactory(() => TaskRepository());

  ioc.registerFactory(() => GoogleSignInService());

  ioc.registerFactory(() => ProjectFactory(ioc<ProjectRepository>()));

  ioc.registerFactory(() => AuthenticationCheckerVm());
  ioc.registerFactory(() => CreateProjectPageVm(ioc<ProjectFactory>(), ioc<ProjectRepository>()));
  ioc.registerFactory(() => SignInPageVm(ioc<GoogleSignInService>()));
  ioc.registerFactory(() => ListProjectPageVm(ioc<ProjectRepository>()));

  ioc.registerFactory(() => DetailProjectPageVm(ioc<TaskRepository>()));

  ioc.registerFactory(() => AuthenticationChecker(ioc<AuthenticationCheckerVm>()));
  ioc.registerFactory(() => ListProjectPage(ioc<ListProjectPageVm>()));
  ioc.registerFactory(() => SignInPage(ioc<SignInPageVm>()));
  ioc.registerFactory(() => CreateProjectPage(ioc<CreateProjectPageVm>()));
  ioc.registerFactory(() => DetailProjectPage(ioc<DetailProjectPageVm>()));
}
