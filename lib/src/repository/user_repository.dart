import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository() : _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<String> signUp(String email, String password, String fullName) async {
    try {
      UserCredential newUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User user;
      user = newUser.user!;
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({'fullName': fullName});
      return "Success";
    } on FirebaseAuthException catch (e) {
      print(e);
      return "$e";
    } catch (e) {
      print(e);
      return "$e";
    }
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
