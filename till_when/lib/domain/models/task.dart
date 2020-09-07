import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  String title;

  Task(this.title);

  factory Task.fromJson(Map<String, dynamic> json) {
    return _$TaskFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TaskToJson(this);
  }

  @override
  String toString() {
    return "name: $title";
  }
}