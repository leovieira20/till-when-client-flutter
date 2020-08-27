import 'package:firebase_auth/firebase_auth.dart';
import 'package:till_when/domain/services/google_sign_in_service.dart';

class SignInPageVm {
  GoogleSignInService service;

  SignInPageVm(this.service);

  Future<UserCredential> googleSignIn() async {
    return service.googleSignIn();
  }
}