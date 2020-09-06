import 'package:mobx/mobx.dart';
import 'package:till_when/domain/models/task.dart';
import 'package:till_when/domain/repositories/task_repository.dart';

part 'detail_project_page_vm.g.dart';

class DetailProjectPageVm = DetailProjectPageVmBase with _$DetailProjectPageVm;

abstract class DetailProjectPageVmBase with Store {
  final TaskRepository taskRepository;

  @observable
  List<Task> tasks;

  DetailProjectPageVmBase(this.taskRepository);

  @action
  Future<void> getTasks(String projectId) async {
    tasks = await taskRepository.getTasksFrom(projectId);
  }
}
