import 'package:test/test.dart';
import 'package:till_when/domain/models/project.dart';
import 'package:till_when/domain/services/queue_generator.dart';

void main() {
  group("Queue generator tests", () {
    test("generates queue for one project", () {
      var project = Project(name: "test");
      var sut = QueueGenerator();
      var queue = sut.generateQueueFor(project);
      expect(queue, isNotNull);
    });
  });
}