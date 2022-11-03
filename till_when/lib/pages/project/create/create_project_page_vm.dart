import 'dart:async';
import 'package:till_when/domain/factories/project_factory.dart';
import 'package:till_when/domain/repositories/project_repository.dart';

class CreateProjectPageVm {
  final ProjectRepository repository;
  final StreamController<bool> _isBusy = StreamController();
  final ProjectFactory projectFactory;

  CreateProjectPageVm(this.projectFactory, this.repository) {
    _isBusy.sink.add(false);
  }

  Future<void> createProject(String name, int numOfTasks, String nameOfTasks) async {
    _isBusy.sink.add(true);

    await repository.create(await projectFactory.make(name, numOfTasks, nameOfTasks));

    _isBusy.sink.add(false);
  }

  dispose() {
    _isBusy.close();
  }

  Stream<bool> get isBusy => _isBusy.stream;
}
