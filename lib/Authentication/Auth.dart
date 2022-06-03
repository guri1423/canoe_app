import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth auth;

  AuthenticationService({required this.auth});

  Stream<User?> get user => auth.authStateChanges();

  Future<String?> createAccount({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }
}