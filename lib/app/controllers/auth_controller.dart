import 'package:get/get.dart';

import '../routes/app_routes.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs; // Reactive login state

  void login() {
    isLoggedIn.value = true; // Update state
    Get.offAllNamed(AppRoutes.HOME); // Navigate to home screen after login
  }

  void logout() {
    isLoggedIn.value = false; // Reset state
    Get.offAllNamed(AppRoutes.LOGIN); // Redirect to login screen
  }
}
