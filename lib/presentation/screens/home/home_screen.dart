import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find(); // Get controller instance

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                authController.isLoggedIn.value ? "Logged In" : "Logged Out")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: authController.logout, // Logout button
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
