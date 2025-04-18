import 'package:get/get.dart';

import '../routes/app_routes.dart';
import 'package:recurly/app/services/auth/login.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:recurly/app/data/models/user_model.dart';
import 'package:hive/hive.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs; // Reactive login state
  var isLoading = false.obs; // Reactive login state
  var user = Rx<UserModel?>(null); // Observable user model
  void login() {
    isLoggedIn.value = true;
    Get.offAllNamed(AppRoutes.HOME);
  }

  void logout() {
    isLoggedIn.value = false;
    Get.offNamed(AppRoutes.LOGIN);
  }

  void navigateToLogin() {
    Get.offNamed(AppRoutes.LOGIN);
  }

  void navigateToSignup() {
    Get.offNamed(AppRoutes.SIGN_UP);
  }

  void navigateToAuth() {
    Get.offNamed(AppRoutes.AUTH);
  }

  void navigateToSplash() {
    Get.offNamed(AppRoutes.SPLASH_SCREEN);
  }

  void navigateToForgetPassword() {
    Get.offNamed(AppRoutes.FORGET_PASSWORD);
  }

  Future<void> loginWithEmailAndPasssword(String email, String password) async {
    try {
      isLoading.value = true;
      User? user = await loginWithEmail(email: email, password: password);
      if (user != null) {
        storeUser(UserModel.fromFirebaseUser(user));
        Get.offAllNamed(AppRoutes.HOME);
      } else {
        isLoggedIn.value = false;
        throw 'User not found or login failed.';
      }
    } catch (e) {
      isLoggedIn.value = false;
      throw e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  final _boxName = 'userBox';

  Future<void> storeUser(UserModel newUser) async {
    var box = await Hive.openBox(_boxName);
    await box.put('user', newUser);
    user.value = newUser;
  }

  Future<void> loadUser() async {
    var box = await Hive.openBox(_boxName);
    UserModel? storedUser = box.get('user');
    if (storedUser != null) {
      user.value = storedUser; 
    }
  }

  // Update user data in Hive
  Future<void> updateUser(UserModel updatedUser) async {
    var box = await Hive.openBox(_boxName); 
    await box.put('user', updatedUser);
    user.value = updatedUser;
  }

  // Clear user data from Hive
  Future<void> clearUser() async {
    var box = await Hive.openBox(_boxName); 
    await box.delete('user'); 
    user.value = null;
  }
}
