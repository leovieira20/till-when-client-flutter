import 'package:till_when/domain/model/project.dart';
import 'package:till_when/domain/repositories/project_repository.dart';

class CreateProjectPageVm {
  ProjectRepository repository;

  CreateProjectPageVm(this.repository);

  Future<void> createProject(String name) async {
    var project = Project(name: name);

    await repository.create(project);
  }
}