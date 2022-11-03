import 'dart:async';
import 'package:till_when/domain/models/project.dart';
import 'package:till_when/domain/repositories/project_repository.dart';

class ListProjectPageVm {
  List<Project> _currentShownProjects = [];
  var _projectsStream = StreamController<List<Project>>();
  
  ProjectRepository _repository;

  ListProjectPageVm(this._repository);
  
  Future<void> fetchProjects() async {
    _currentShownProjects = await _repository.list();
    _projectsStream.sink.add(_currentShownProjects);
  }

  deleteProject(Project p) async {
    _currentShownProjects.remove(p);
    _projectsStream.add(_currentShownProjects);

    _repository.delete(p);
  }

  Future<void> reorderProjects(int oldIx, int newIx, List<Project> projects) async {
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

  Stream<List<Project>> get projects => _projectsStream.stream;
}
