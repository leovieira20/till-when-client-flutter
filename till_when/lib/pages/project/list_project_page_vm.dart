import 'dart:async';
import 'package:till_when/domain/models/project.dart';
import 'package:till_when/domain/repositories/project_repository.dart';

class ListProjectPageVm {
  var _projectsStream = StreamController<List<Project>>();
  
  ProjectRepository _repository;

  ListProjectPageVm(this._repository);
  
  Future<void> fetchProjects() async {
    _projectsStream.sink.add(await _repository.list());
  }

  Future<void> changeProject(String action, Project p) {
    switch (action) {
      case 'remove':
        return _delete(p);
        break;
      default:
        throw ArgumentError('invalid action $action');
    }
  }

  Future<void> reorderProjects(num oldIx, num newIx, List<Project> projects) async {
    var p = projects.removeAt(oldIx);
    projects.insert(newIx, p);

    for (var i = 0; i < projects.length; ++i) {
      projects[i].priority = projects.length - i;
    }

    _projectsStream.add(projects);
    await _repository.updateBatch(projects);
  }

  dispose() {
    _projectsStream.close();
  }

  Future<void> _delete(Project p) async {
    await _repository.delete(p);
  }

  Stream<List<Project>> get projects => _projectsStream.stream;
}
