import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<User?> signupWithEmail({
  required String email,
  required String password,
  required String displayName,
}) async {
  try {
    // Attempt to create a new user
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );

    print(displayName);
    User? user = result.user;

    if (user != null) {
      await user.updateProfile(displayName: displayName);
      await user.reload();
      user = FirebaseAuth.instance.currentUser; // Get the updated user
      return user;
    }
    // Update the display name after user creation
  } on FirebaseAuthException catch (e) {
    // Handle Firebase-specific errors
    print(e);
    switch (e.code) {
      case 'invalid-email':
        throw 'The email address is badly formatted.';
      case 'user-disabled':
        throw 'Your account has been disabled. Please contact support.';
      case 'user-not-found':
        throw 'No user found for that email. Please register.';
      case 'wrong-password':
        throw 'The password is incorrect.';
      case 'email-already-in-use':
        throw 'This email address is already in use by another account.';
      case 'operation-not-allowed':
        throw 'This operation is not allowed. Please enable it in Firebase console.';
      case 'weak-password':
        throw 'The password is too weak. Please choose a stronger password.';
      case 'invalid-credential':
        throw 'The email or password format is invalid.';
      case 'too-many-requests':
        throw 'Too many requests. Please try again later.';
      case 'network-request-failed':
        throw 'Network error. Please check your internet connection and try again.';
      default:
        throw 'An unknown error occurred. Please try again later.';
    }
  } catch (e) {
    // Handle any other errors (network issues, etc.)
    throw "Unexpected error: $e";
  }
}
