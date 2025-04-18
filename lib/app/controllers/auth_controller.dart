import 'package:get/get.dart';

import '../routes/app_routes.dart';
import 'package:recurly/app/services/auth/login.dart';
import "package:firebase_auth/firebase_auth.dart";

class AuthController extends GetxController {
  var isLoggedIn = false.obs; // Reactive login state
  var isLoading = false.obs; // Reactive login state
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

  Future<void> loginWithEmailAndPasssword(String email, String password) async {
    try {
      isLoading.value = true; // Set loading to true when login starts
      User? user = await loginWithEmail(email: email, password: password);

      if (user != null) {
        Get.offAllNamed(AppRoutes.HOME);
      } else {
        isLoggedIn.value = false;
        throw 'User not found or login failed.';
      }
    } catch (e) {
      isLoggedIn.value = false;
      throw e.toString();
    } finally {
      isLoading.value =
          false; // Ensure loading is set to false when the operation completes
    }
  }
}
