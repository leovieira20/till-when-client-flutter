import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  String getLoggedUserEmail() {
    return FirebaseAuth.instance.currentUser.email;
  }
}