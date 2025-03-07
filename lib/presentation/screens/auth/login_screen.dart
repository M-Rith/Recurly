import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController =
        Get.find(); // Find existing controller

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: authController.login, // Call login method
          child: Text("Login"),
        ),
      ),
    );
  }
}
