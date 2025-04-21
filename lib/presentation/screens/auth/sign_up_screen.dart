import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recurly/app/routes/app_routes.dart';
import 'package:recurly/app/themes/spacing.dart';
import '../../../app/controllers/auth_controller.dart';
import '../../../app/themes/colors.dart';
import '../../../app/themes/font_size.dart';
import "package:heroicons/heroicons.dart";
import 'package:recurly/presentation/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();

  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  @override
  final AuthController authController = Get.find();
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView(
        physics: isKeyboardOpen
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(left: Spacing.md, right: Spacing.md),
        children: [
          const SizedBox(height: Spacing.xl * 2),
          const Text(
            "Become one of us 🤘",
            style: TextStyle(
              fontSize: FontSize.xxl,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: Spacing.sm),
          const Text(
            "Stay on top of payments and subscriptions",
            style: TextStyle(fontSize: FontSize.sm, color: AppColors.secondary),
          ),
          const SizedBox(height: Spacing.xl * 2),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomizedTextField(
                  hintText: 'example@gmail.com',
                  labelText: 'Email',
                  prefixIcon: HeroIcons.envelope,
                  controller: emailController,
                  focusNode: emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!GetUtils.isEmail(value)) {
                      return "Invalid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Spacing.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account ?",
                      style: TextStyle(
                          color: AppColors.secondary, fontSize: FontSize.sm),
                    ),
                    const SizedBox(width: Spacing.xs),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(AppRoutes.LOGIN);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
