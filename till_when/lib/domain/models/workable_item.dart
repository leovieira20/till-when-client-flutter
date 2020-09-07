import 'package:till_when/domain/models/task.dart';

abstract class WorkableItem {
  bool isPending();
  List<Task> getTasks();
}