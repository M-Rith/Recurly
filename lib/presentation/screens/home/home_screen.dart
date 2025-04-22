import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/controllers/auth_controller.dart';
import '../../../app/themes/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find(); // Get controller instance

    print(authController.isLoggedIn.value);
    print(authController.user.toJson());
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Container(
          color: AppColors.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  authController.isLoggedIn.value ? "Logged In" : "Logged Out",
                  style: TextStyle(color: AppColors.success),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: authController.logout,
                child: const Text(
                  "Logout",
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
