import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  Future<UserCredential?> googleSignIn() async {
    return kIsWeb ? await _signInForWeb() : await _signInForMobile();
  }

  Future<UserCredential?> _signInForWeb() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      return await FirebaseAuth.instance.signInWithPopup(googleProvider);
    } on FirebaseAuthException catch(e) {
      if (e.code == "popup-closed-by-user") {
        return null;
      }

      rethrow;
    }
  }

  Future<UserCredential?> _signInForMobile() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on NoSuchMethodError {
      return null;
    }
  }
}