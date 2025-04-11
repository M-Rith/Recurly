import 'package:flutter/material.dart';
import '../../../app/themes/colors.dart';
import '../../../app/themes/font_size.dart';
import '../../../app/themes/spacing.dart';
import 'package:get/get.dart';
import '../../../app/controllers/auth_controller.dart';

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
              height: Spacing.xl,
            ),

            // Login Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  authController.navigateToLogin();
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: FontSize.md,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: Spacing.lg,
            ),

            // Signup Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: AppColors.white),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  authController.navigateToSignup();
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: FontSize.md,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
