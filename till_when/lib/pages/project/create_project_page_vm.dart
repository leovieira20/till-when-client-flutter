import 'dart:async';

import 'package:till_when/domain/model/project.dart';
import 'package:till_when/domain/repositories/project_repository.dart';

class CreateProjectPageVm {
  final ProjectRepository repository;
  final StreamController<bool> _isBusy = StreamController();

  CreateProjectPageVm(this.repository) {
    _isBusy.sink.add(false);
  }

  Future<void> createProject(String name) async {
    _isBusy.sink.add(true);

    var project = Project(name: name);

    await repository.create(project);

    _isBusy.sink.add(false);
  }

  dispose() {
    _isBusy.close();
  }

  Stream<bool> get isBusy => _isBusy.stream;
}
