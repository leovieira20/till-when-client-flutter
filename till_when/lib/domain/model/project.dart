class Project {
  String name;

  Project({this.name});

  factory Project.fromJson(Map<String, dynamic> data) {
    return Project(name: data["name"]);
  }

  Map<String, String> toJson() {
    return {
      "name": name
    };
  }
}
