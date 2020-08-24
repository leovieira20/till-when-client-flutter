import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:till_when/domain/model/project.dart';
import 'package:till_when/domain/repositories/user_repository.dart';

class ProjectRepository {
  UserRepository _userRepository;

  ProjectRepository(this._userRepository);

  Future<void> create(Project p) async {
    var email = _userRepository.getLoggedUserEmail();

    await FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .collection("projects")
        .add(p.toJson());
  }
}
