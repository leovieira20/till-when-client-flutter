class Project {
  DateTime createdAt;
  String id;
  String name;
  num priority;

  Project({this.id, this.name, this.priority = 0, DateTime createdAt}) : createdAt = DateTime.now();

  factory Project.fromJson(String id, Map<String, dynamic> data) {
    return Project(
      id: id,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data["createdAt"]),
      name: data["name"],
      priority: data["priority"],
    );
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
