class Project {
  String id;
  String name;

  Project({this.id, this.name});

  factory Project.fromJson(String id, Map<String, dynamic> data) {
    return Project(
      id: id,
      name: data["name"],
    );
  }

  Map<String, String> toJson() {
    return {
      "name": name,
    };
  }
}
