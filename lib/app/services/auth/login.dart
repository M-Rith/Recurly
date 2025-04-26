import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<User?> loginWithEmail({
  required String email,
  required String password,
}) async {
  try {
    // Attempt login
    UserCredential result = await _auth.signInWithEmailAndPassword(
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
        throw 'No user found for that email.';
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

// Login with gogole
Future<User?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return null; // User canceled the sign-in
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await _auth.signInWithCredential(
      credential,
    );
    return userCredential.user;
  } catch (error) {
    print("Google Sign-In Error: $error");
    return null;
  }
}
