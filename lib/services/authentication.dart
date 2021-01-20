import 'package:firebase_auth/firebase_auth.dart';

class AuthenticateProvider {
  final FirebaseAuth firebaseAuth;

  AuthenticateProvider(this.firebaseAuth);

  Stream<User> get authstate => firebaseAuth.idTokenChanges();

  //Sign Up method
  Future<String> signUp({String email, String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "SignedUp";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //sign in method..
  Future<String> signIn({String email, String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "SignedIn";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signOut() async {
    await firebaseAuth.signOut();
    return "SignOut";
  }
}
