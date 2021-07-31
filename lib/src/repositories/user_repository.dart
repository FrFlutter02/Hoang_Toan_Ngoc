import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  UserRepository() : _firebaseAuth = FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  Future<void> sendPasswordResetMail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
  }
}
