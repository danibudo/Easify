import 'package:easify/models/theuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  // Constructor
  AuthenticationService(this._firebaseAuth);

  // Auth change user stream (get info about the user everytime the auth state changes)
  Stream<TheUser> get authStateChanges {
    return _firebaseAuth.authStateChanges().map(_userFromFirebaseUser);
    // the mapping above is equivalent to:
    //.map((User user) => _userFromFirebaseUser(user));
  }

  // Create user object based on FirebaseUser
  TheUser _userFromFirebaseUser(User user) {
    return user != null ? TheUser(uid: user.uid) : null;
  }

  Future signIn({String email, String password}) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
