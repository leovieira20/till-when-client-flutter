import 'package:till_when/domain/models/activity.dart';
import 'package:till_when/domain/models/task.dart';
import 'package:till_when/domain/models/workable_item.dart';

class Queue {
  final List<WorkableItem> _items;
  final int _quota;
  final queue = Map<String, List<Activity>>();

  Queue(List<WorkableItem> items, {int quota = 1})
      : _items = items,
        _quota = quota {
    _buildQueue();
  }

  List<Activity> getTasksFor(DateTime date) {
    return _getListForDate(date);
  }

  void _buildQueue() {
    var pendingItems = _items.where((element) => element.isPending()).toList();
    var tasksFromItems = _getTasksFromItems(pendingItems);

    var taskIndex = 0;
    var neededDaysToAccommodateAllTasks = _calculateNumberOfDays(tasksFromItems).round();

    for (var j = 0; j < neededDaysToAccommodateAllTasks; ++j) {
      var currentDate = DateTime.now().add(Duration(days: j));
      _createListForDate(currentDate);

      while(_quotaIsNotFilledFor(currentDate) && taskIndex < tasksFromItems.length) {
        _addActivityToDate(currentDate, tasksFromItems[taskIndex++]);
      }
    }
  }

  _getTasksFromItems(List<WorkableItem> items) {
    var tasks = List<Task>();
    for (var i in items) {
      tasks.addAll(i.getTasks());
    }
    return tasks;
  }

  num _calculateNumberOfDays(List<Task> tasks) {
    return tasks.length / _quota;
  }

  bool _quotaIsNotFilledFor(DateTime today) {
    return _getListForDate(today).length < _quota;
  }

  void _addActivityToDate(DateTime date, Task t) {
    _getListForDate(date).add(Activity(t.title));
  }

  void _createListForDate(DateTime date) {
    queue.putIfAbsent(_toSimpleDate(date), () => List<Activity>());
  }

  List<Activity> _getListForDate(DateTime date) {
    return queue[_toSimpleDate(date)] ?? List<Activity>();
  }

  String _toSimpleDate(DateTime date) => "${date.year}/${date.month}/${date.day}";
}
