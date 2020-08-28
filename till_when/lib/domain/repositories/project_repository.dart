import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:till_when/domain/models/project.dart';
import 'package:till_when/domain/repositories/user_repository.dart';

class ProjectRepository {
  UserRepository _userRepository;

  ProjectRepository(this._userRepository);

  Future<void> create(Project p) async {
    var email = _userRepository.getLoggedUserEmail();

    await FirebaseFirestore.instance.collection("users").doc(email).collection("projects").add(p.toJson());
  }

  Future<List<Project>> list() async {
    var email = _userRepository.getLoggedUserEmail();

    var querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .collection("projects")
        .orderBy("priority", descending: true)
        .get();

    return querySnapshot
        .docs
        .map((e) => Project.fromJson(e.id, e.data()))
        .toList();
  }

  Future<void> delete(Project p) {
    var email = _userRepository.getLoggedUserEmail();

    return FirebaseFirestore.instance.collection("users").doc(email).collection("projects").doc(p.id).delete();
  }

  Future<void> update(Project p) {
    var email = _userRepository.getLoggedUserEmail();

    return FirebaseFirestore.instance.collection("users").doc(email).collection("projects").doc(p.id).set(p.toJson(),);
  }

  Future<void> updateBatch(List<Project> projects) async {
    var email = _userRepository.getLoggedUserEmail();
    
    var instance = FirebaseFirestore.instance;
    var transaction = instance.runTransaction((t) async {
      for (var o in projects) {
        
        var docPath = instance.doc("users/$email/projects/${o.id}");
        t.update(docPath, o.toJson());
      }
    });

    await transaction;
  }

  Future<num> getHighestProjectPriority() async {
    var email = _userRepository.getLoggedUserEmail();

    var projects = await FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .collection("projects")
        .orderBy("priority", descending: true)
        .limit(1)
        .snapshots()
        .map((query) => query.docs)
        .map((docs) => docs.map((e) => Project.fromJson(e.id, e.data())).toList())
        .first;

    return projects.isEmpty ? 1 : projects.first.priority + 1;
  }
}
