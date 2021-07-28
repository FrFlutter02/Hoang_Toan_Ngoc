import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository() : _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUp(String email, String password, String fullName) {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() {
    return Future.wait([_firebaseAuth.signOut()]);
  }

  Future<bool> isSignedIn() async {
    return _firebaseAuth.currentUser != null;
  }

  Future<User> getUser() async {
    return _firebaseAuth.currentUser!;
  }
}
