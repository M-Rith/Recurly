import 'package:get/get.dart';

import '../routes/app_routes.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs; // Reactive login state

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
}
