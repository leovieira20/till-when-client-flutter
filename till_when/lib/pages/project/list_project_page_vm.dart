import 'package:till_when/domain/model/project.dart';
import 'package:till_when/domain/repositories/project_repository.dart';

class ListProjectPageVm {
  ProjectRepository repository;

  ListProjectPageVm(this.repository);

  Stream<List<Project>> getProjects() {
    return repository.list();
  }

  Future<void> deleteProject(Project p) {
    return repository.delete(p);
  }
}