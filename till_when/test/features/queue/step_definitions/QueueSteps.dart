import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:ogurets/ogurets.dart';
import 'package:till_when/domain/models/queue.dart';
import 'package:till_when/domain/models/task.dart';
import 'package:till_when/domain/models/workable_item.dart';

class WorkableItemMock extends Mock implements WorkableItem {
}

class QueueSteps {
  Queue _queue;
  int _quota;
  List<WorkableItem> _workableItems;

  @Given(r'a queue with {int} per day')
  void aQueueWithPerDay(int quota) async {
    _quota = quota;
  }

  @And(r'{int} workable items')
  void workableItems(int items) async {
    _workableItems =  List.generate(items, (index) => WorkableItemMock());
  }

  @And(r'{int} are present')
  void arePresent(int tasks) async {
    for (var wi in _workableItems) {
      var list = List.generate((tasks / _workableItems.length).round(), (index) => Task(random.string(10)));
      when(wi.getTasks()).thenReturn(list);
    }
  }

  @Given(r'workable item is done')
  void workableItemIsDone() async {
    var wi = WorkableItemMock();
    when(wi.isPending()).thenReturn(false);
    _workableItems = [wi];
  }

  @And(r'workable item is pending')
  void workableItemIsPending() async {
    for (var wi in _workableItems) {
      when(wi.isPending()).thenReturn(true);
    }
  }

  @When(r'queue is created')
  void queueIsCreated() async {
    _queue = Queue(_workableItems, quota: _quota);
  }

  @Then(r'there should be no tasks for today')
  void thereShouldBeNoTasksForToday() async {
    var tasksForToday = _queue.getTasksFor(DateTime.now());
    assert(tasksForToday == null);
  }

  @Then(r'first day should have {int} tasks')
  void firstDayShouldHaveTasks(int firstDay) async {
    var activitiesForDayOne = _queue.getTasksFor(DateTime.now());
    assert(activitiesForDayOne.length == firstDay);
  }

  @And(r'second day should have {int} tasks')
  void secondDayShouldHaveTasks(int secondDay) async {
    var activitiesForDayOne = _queue.getTasksFor(DateTime.now().add(Duration(days: 1)));
    assert(activitiesForDayOne.length == secondDay);
  }
}