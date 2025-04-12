import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/controllers/auth_controller.dart';
import '../../../app/themes/colors.dart';
import '../../../app/themes/font_size.dart';
import '../../../app/themes/spacing.dart';
import 'package:heroicons/heroicons.dart';
import 'package:recurly/presentation/widgets/custom_text_field.dart';

import '../../../app/utils/email_validate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  var showPassword = false;

  @override
  void dispose() {
    passwordController.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Spacing.xl),
                const Text(
                  "Hi, Welcome Back! 👋",
                  style: TextStyle(
                    fontSize: FontSize.xxl,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Hello again, you've been missed !",
                  style: TextStyle(
                      fontSize: FontSize.sm, color: AppColors.secondary),
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
                          if (!isEmail(value)) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: Spacing.md,
                      ),
                      CustomizedTextField(
                        hintText: 'Password',
                        labelText: 'Password',
                        prefixIcon: HeroIcons.lockClosed,
                        suffixIcon:
                            showPassword ? HeroIcons.eyeSlash : HeroIcons.eye,
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: !showPassword,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        suffixIconAction: (value) {
                          setState(() {
                            showPassword = value;
                          });
                        },
                      ),
                      const SizedBox(height: Spacing.md),
                      Container(
                        alignment: Alignment.centerRight,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            // authController.navigateToForgotPassword();
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: FontSize.sm,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: Spacing.lg,
                      ),
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
                            if (_formKey.currentState!.validate()) {
                              print(emailController.text);
                              print(passwordController.text);
                              authController.login();
                            } else {
                              print("Form is not valid");
                            }
                            // authController.login();
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
                    ],
                  ),
                ),
                const SizedBox(height: Spacing.xl),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.secondary,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'or continue with',
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.secondary,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Spacing.md,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Login with Google"),
                ),
                const SizedBox(height: Spacing.xl),
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: FontSize.sm,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(width: Spacing.sm),
                        GestureDetector(
                          onTap: () {
                            authController.navigateToAuth();
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
