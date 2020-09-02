import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:till_when/domain/models/project.dart';
import 'package:till_when/domain/repositories/user_repository.dart';

class ProjectRepository {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  CollectionReference _projectCollection;

  UserRepository _userRepository;

  ProjectRepository(this._userRepository) {
    var email = _userRepository.getLoggedUserEmail();
    _projectCollection = _instance.collection("users").doc(email).collection("projects");
  }

  Future<void> create(Project p) async {
    var projRef = await _projectCollection.add(p.toJson());

    var transaction = _instance.runTransaction(
      (t) async {
        for (var task in p.tasks) {
          projRef.collection("tasks").add(task.toJson());
        }
      },
    );

    await transaction;
  }

  Future<List<Project>> list() async {
    var querySnapshot = await _projectCollection.orderBy("priority", descending: true).get();

    return querySnapshot.docs.map((e) => Project.fromJson(e.id, e.data())).toList();
  }

  Future<void> delete(Project p) {
    return _projectCollection.doc(p.id).delete();
  }

  Future<void> update(Project p) {
    return _projectCollection.doc(p.id).set(p.toJson());
  }

  Future<void> updateBatch(List<Project> projects) async {
    var email = _userRepository.getLoggedUserEmail();

    var transaction = _instance.runTransaction((t) async {
      for (var o in projects) {
        var docPath = _instance.doc("users/$email/projects/${o.id}");
        t.update(docPath, o.toJson());
      }
    });

    await transaction;
  }

  Future<num> getHighestProjectPriority() async {
    var projects = await _projectCollection
        .orderBy("priority", descending: true)
        .limit(1)
        .snapshots()
        .map((query) => query.docs)
        .map((docs) => docs.map((e) => Project.fromJson(e.id, e.data())).toList())
        .first;

    return projects.isEmpty ? 1 : projects.first.priority + 1;
  }
}
