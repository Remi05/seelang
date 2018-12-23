import 'package:seelang/models/user.dart';

abstract class AuthService {
  User get currentUser;
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> signInWithGoogle();
  Future<Null> signOut();  
}