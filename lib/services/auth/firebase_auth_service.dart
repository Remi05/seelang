import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:seelang/models/user.dart';
import 'package:seelang/services/auth/auth_service.dart';
import 'package:seelang/services/exceptions.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  User _user;
  User get currentUser => _user;

  User _userFromFirebaseUser(FirebaseUser firebaseUser) {
    return firebaseUser == null ? null : new User(
        id: firebaseUser.uid,
        displayName: firebaseUser.displayName ?? '',
        email: firebaseUser.email,
        photoUrl: firebaseUser.photoUrl
    );
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      FirebaseUser firebaseUser = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      _user = _userFromFirebaseUser(firebaseUser);
    }
    catch (e) {
      print(e);
    }
    return currentUser;
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseUser firebaseUser = await _firebaseAuth.signInWithCredential(credential);
      _user = _userFromFirebaseUser(firebaseUser);
    }
    catch (e) {
      print(e);
    }
    return currentUser;
  }

  Future<Null> signOut() async {
    _user = null;
  }
}