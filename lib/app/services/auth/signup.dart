import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<User?> signupWithEmail({
  required String email,
  required String password,
  required String displayName,
}) async {
  try {
    // Attempt login
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    return result.user; // Return the logged-in user
  } on FirebaseAuthException catch (e) {
    // Handle Firebase-specific errors
    switch (e.code) {
      case 'invalid-email':
        throw 'Please enter a valid email address.';
      case 'user-disabled':
        throw 'Account has been disabled. Please contact support.';
      case 'user-not-found':
        throw'No user found for that email.';
      case 'wrong-password':
        throw 'Incorrect password.';
      case 'invalid-credential':
        throw 'Invalid email or password.';
      default:
        throw 'An unknown error occurred. Please try again later.';
    }
  } catch (e) {
    // Handle any other errors (network issues, etc.)
    throw "Unexpected error: $e";
  }
}
