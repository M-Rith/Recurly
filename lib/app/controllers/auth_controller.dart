import 'package:get/get.dart';

import '../routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoggedIn = false.obs; // Reactive login state
  var email = "".obs;
  var password = "".obs;

  void login() {
    isLoggedIn.value = true;
    Get.offAllNamed(
      AppRoutes.HOME,
    );
  }

  void logout() {
    isLoggedIn.value = false;
    Get.offNamed(
      AppRoutes.LOGIN,
    );
  }

  void navigateToLogin() {
    Get.offNamed(
      AppRoutes.LOGIN,
    );
  }

  void navigateToSignup() {
    Get.offNamed(
      AppRoutes.SIGN_UP,
    );
  }

  void navigateToAuth() {
    Get.offNamed(
      AppRoutes.AUTH,
    );
  }

  void navigateToSplash() {
    Get.offNamed(
      AppRoutes.SPLASH_SCREEN,
    );
  }

  void navigateToForgetPassword() {
    Get.offNamed(
      AppRoutes.FORGET_PASSWORD,
    );
  }

  Future<User?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      print(e.code);
      print(e);
      switch (e.code) {
        case 'invalid-email':
          throw Exception('Please enter a valid email address.');
        case 'user-disabled':
          throw Exception('account has been disabled. Please contact support.');
        case 'user-not-found':
          throw Exception('No user found for that email.');
        case 'wrong-password':
          throw Exception('Incorrect password.');
        case 'invalid-credential':
          throw Exception('Invalid email or password.');
        // Add more cases as needed
        default:
          throw Exception('An unknown error occurred. Please try again later.');
      }
    } catch (e) {
      // Handle any other errors
      throw Exception("Unexpected error: $e");
    }
  }
}
