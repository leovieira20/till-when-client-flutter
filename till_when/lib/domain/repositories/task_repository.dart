import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:till_when/domain/models/task.dart';

class TaskRepository {
  final FirebaseFirestore instance = FirebaseFirestore.instance;
  final String? email = FirebaseAuth.instance.currentUser?.email;

  Future<List<Task>> getTasksFrom(String projectId) {
    return instance
        .collection("users")
        .doc(email)
        .collection("projects")
        .doc(projectId)
        .collection("tasks")
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs)
        .map((snapshots) => snapshots.map((e) => Task.fromJson(e.data())).toList())
        .first;
  }
}
