import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  UserRepository() : _firebaseAuth = FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  Future<String> signInWithCredentials(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "signed in";
    } on FirebaseAuthException catch (e) {
      return "error";
    }
  }

  Future<void> signUp(String email, String password, String fullName) async {
    try {
      UserCredential newUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User user;
      user = newUser.user!;
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({'fullName': fullName});
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<List<void>> signOut() async {
    return Future.wait([_firebaseAuth.signOut()]);
  }

  Future<bool> isSignedIn() async {
    User currentUser = _firebaseAuth.currentUser!;
    return currentUser != null;
  }

  Future<User> getUser() async {
    return _firebaseAuth.currentUser!;
  }

  Future<void> sendPasswordResetMail(String email) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
