import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recurly/app/routes/app_routes.dart';
import '../../../app/controllers/auth_controller.dart';
import '../../../app/themes/colors.dart';
import '../../../app/themes/font_size.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override

  final AuthController authController = Get.find();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Sign Up Screen",
            style: TextStyle(
              fontSize: FontSize.xl,
              color: AppColors.primary,
            ),
            selectionColor: AppColors.primary,
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
