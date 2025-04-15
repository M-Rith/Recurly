import 'package:flutter/material.dart';
import '../../../app/themes/colors.dart';
import '../../../app/themes/font_size.dart';
import '../../../app/themes/spacing.dart';
import 'package:get/get.dart';
import '../../../app/controllers/auth_controller.dart';
import 'package:recurly/presentation/widgets/custom_button.dart';
class AuthScreen extends StatelessWidget {

 const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.only(left: Spacing.md, right: Spacing.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: Spacing.xl * 2,
            ),
            const Text(
              "Recurly",
              style: TextStyle(
                fontSize: FontSize.xxl,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: Spacing.lg,
            ),
            Image.asset(
              'assets/images/testing.png',
                height: 300,
            ),
            const Spacer(),
            const Text(
              "One App, Every Subscription",
              style: TextStyle(
                fontSize: FontSize.xl,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: Spacing.sm,
            ),
            const Text(
              "No more surprise charges — get notified, stay organized, and cancel anytime",
              style: TextStyle(
                fontSize: FontSize.sm,
                color: AppColors.secondary,
                
              ),
            ),
            const SizedBox(
              height: Spacing.lg,
            ),

            // Login Button
            CustomButton(
              title: "Log in",
              onTap: () {
                authController.navigateToLogin();
              },
            ),
            const SizedBox(
              height: Spacing.lg,
            ),

            // Signup Button
            CustomButton(
              title: "Sign up",
              onTap: () {
                authController.navigateToSignup();
              },
              isOutlined: true,
            ),
            const SizedBox(
              height: Spacing.xl * 2,
            ),
          ],
        ),
      ),
    );
  }
}
