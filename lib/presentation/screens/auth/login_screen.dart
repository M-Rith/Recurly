import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/controllers/auth_controller.dart';
import '../../../app/themes/colors.dart';
import '../../../app/themes/font_size.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find(); // Find existing controller

    return Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            const Text("Login Screen", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 20),
            const Text("This is a new testing", style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 20)),
            const Text("This is a new testing", style: TextStyle(color: Colors.white, fontSize: FontSize.xxl )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: authController.login, // Call login method
              child: const Text("This is a new testing"),
            ),
          ]
        ,
        ),);
  }
}
