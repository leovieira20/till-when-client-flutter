class Project {
  String name;

  Project({this.name});

  Map<String, String> toJson() {
    return {
      "name": name
    };
  }
}
