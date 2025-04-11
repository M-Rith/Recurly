import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recurly/app/routes/app_routes.dart';
import '../../../app/controllers/auth_controller.dart';
import '../../../app/themes/colors.dart';
import '../../../app/themes/font_size.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const Text(
            "Login Screen",
            style: TextStyle(
              fontSize: FontSize.xl,
              color: AppColors.primary,
            ),
            selectionColor: AppColors.primary,
          ),
          ElevatedButton(
            onPressed: authController.login, // Call login method
            child: const Text("This is a new testing"),
          ),
          ElevatedButton(
            onPressed: authController.navigateToAuth,
            child: const Text("This is a new testing"),
          ),
        ],
      ),
    );
  }
}
