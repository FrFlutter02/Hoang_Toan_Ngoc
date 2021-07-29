import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  UserRepository() : _firebaseAuth = FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  Future<void> signUp(String email, String password) {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> sendPasswordResetMail(String email) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
