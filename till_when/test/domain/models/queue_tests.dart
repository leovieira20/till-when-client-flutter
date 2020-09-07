import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:till_when/domain/models/activity.dart';
import 'package:till_when/domain/models/queue.dart';
import 'package:till_when/domain/models/task.dart';
import 'package:till_when/domain/models/workable_item.dart';

class WorkableItemMock extends Mock implements WorkableItem {}

void main() {
  group("Queue tests", () {
    Queue queue;
    WorkableItem workableItem;
    DateTime firstDay = DateTime.now();

    group("Activities from backlog", () {
      setUp(() {
        workableItem = WorkableItemMock();
      });

      group("Given workable item is pending", () {
        setUp(() {
          when(workableItem.isPending()).thenReturn(true);
        });

        group("And a queue with two quotas per day", () {
          group("And a backlog with three tasks", () {
            var taskOne = Task("task_01");
            var taskTwo = Task("task_02");
            var taskThree = Task("task_03");

            setUp(() {
              when(workableItem.getTasks()).thenReturn([taskOne, taskTwo, taskThree]);

              queue = Queue([workableItem], quota: 2);
            });

            group("When queue is build", () {
              List<Activity> activitiesForDayOne;
              List<Activity> activitiesForDayTwo;

              setUp(() {
                activitiesForDayOne = queue.getTasksFor(firstDay);
                activitiesForDayTwo = queue.getTasksFor(firstDay.add(Duration(days: 1)));
              });

              test("Then day one should have two tasks", () {
                expect(activitiesForDayOne.length, equals(2));
              });

              test("Then day two should have one task", () {
                expect(activitiesForDayOne.length, equals(1));
              });
            });
          });
        });

        group("And a backlog with one task", () {
          var task = Task("task_01");

          setUp(() {
            when(workableItem.getTasks()).thenReturn([task]);
            queue = Queue([workableItem]);
          });

          test("Then queue should have one task for today", () {
            var tasksForToday = queue.getTasksFor(firstDay);
            var firstTaskOfToday = tasksForToday.first;

            expect(firstTaskOfToday, isNotNull);
          });
        });

        group("And a backlog with two tasks", () {
          var taskOneTitle = "task_01";
          var taskTwoTitle = "task_02";

          setUp(() {
            when(workableItem.getTasks()).thenReturn([Task(taskOneTitle), Task(taskTwoTitle)]);
            queue = Queue([workableItem]);
          });

          group("When both tasks are pending", () {
            test("Then queue should have one task per day", () {
              var dayOneQueue = queue.getTasksFor(firstDay);
              var tasksForDayOne = dayOneQueue;
              expect(tasksForDayOne.length, equals(1));

              var taskOfDayOne = tasksForDayOne.first;
              expect(taskOfDayOne.title, equals(taskOneTitle));

              var dayTwoQueue = queue.getTasksFor(firstDay.add(Duration(days: 1)));
              var tasksForDayTwo = dayTwoQueue;
              var taskOfDayTwo = tasksForDayTwo.first;

              expect(taskOfDayTwo.title, equals(taskTwoTitle));
            });
          });
        });
      });
    });
  });
}
