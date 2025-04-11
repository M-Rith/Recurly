import 'package:get/get.dart';

import '../routes/app_routes.dart';

class AuthController extends GetxController {
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
}
