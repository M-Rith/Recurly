import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recurly/app/themes/colors.dart';
import 'package:recurly/app/themes/font_size.dart';
import '../../../app/controllers/auth_controller.dart';
import '../../../app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController authController = Get.find();

  @override
  void initState() {
    super.initState();
    authController.loadUser();
    Future.delayed(const Duration(seconds: 3), () {
      if (authController.user.value != null) {
        authController.isLoggedIn.value = true;
        Get.offAllNamed(AppRoutes.HOME);
      } else {
        Get.offAllNamed(AppRoutes.AUTH);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            ScaleAnimatedText(
              'Recurly',
              textStyle: const TextStyle(
                fontSize: FontSize.xxxl,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
              duration: const Duration(seconds: 6),
            ),
          ],
        ),
      ),
    );
  }
}
