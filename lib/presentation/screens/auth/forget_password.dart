import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:recurly/app/themes/spacing.dart';
import 'package:recurly/app/themes/font_size.dart';
import 'package:recurly/app/themes/colors.dart';
import '../../../app/controllers/auth_controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.only(
          left: Spacing.md,
          right: Spacing.md,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Spacing.xl * 2),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    authController.navigateToLogin();
                  },
                  child: const HeroIcon(
                    HeroIcons.arrowLeftCircle,
                    size: Spacing.xl,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: Spacing.sm),
                const Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: FontSize.xxl,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: Spacing.sm),
            const Text(
              "Please enter your email address and we'll send you a link to reset your password.",
              style: TextStyle(fontSize: FontSize.sm, color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
