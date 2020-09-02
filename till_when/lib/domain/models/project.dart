import 'package:flutter/material.dart';
import 'package:till_when/domain/models/task.dart';

class Project {
  DateTime createdAt;
  String id;
  String name;
  num priority;
  List<Task> tasks;

  Project({this.id, @required this.name, this.priority = 0, DateTime createdAt})
      : createdAt = DateTime.now(),
        tasks = List<Task>();

  factory Project.fromJson(String id, Map<String, dynamic> data) {
    return Project(
      id: id,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data["createdAt"]),
      name: data["name"],
      priority: data["priority"],
    );
  }

  factory Project.withTasks({String name, num priority, num numOfTasks, String nameOfTasks}) {
    var project = Project(name: name, priority: priority);

    for (var i = 0; i < numOfTasks; ++i) {
      var task = Task("${nameOfTasks}_${(i + 1).toString().padLeft(2, '0')}");
      project.tasks.add(task);
    }

    return project;
  }

  Map<String, dynamic> toJson() {
    return {
      "createdAt": createdAt.millisecondsSinceEpoch,
      "name": name,
      "priority": priority,
    };
  }

  @override
  String toString() {
    return "name: $name, priority: $priority";
  }
}
