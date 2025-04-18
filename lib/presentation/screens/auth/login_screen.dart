import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recurly/presentation/widgets/custom_button.dart';
import '../../../app/controllers/auth_controller.dart';
import '../../../app/themes/colors.dart';
import '../../../app/themes/font_size.dart';
import '../../../app/themes/spacing.dart';
import 'package:heroicons/heroicons.dart';
import 'package:recurly/presentation/widgets/custom_text_field.dart';

import '../../../app/utils/email_validate.dart';
import 'package:recurly/presentation/widgets/custom_snackbar.dart';

import 'package:recurly/app/data/models/status.dart';

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
  var _isLoading = false;

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

    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    void handleLogin() async {
      setState(() {
        _isLoading = true;
      });
      try {
        final user = await authController.loginWithEmail(
          email: emailController.text,
          password: passwordController.text,
        );

        if (user != null) {
          // Navigate to home or show success
          authController.login();
        }
      } catch (e) {
        // Show error in Snackbar or Dialog
        showCustomSnackbar(
          title: "Login Failed",
          status: MessageStatus.error,
          message: e.toString(),
          context: context,
        );
      }
      setState(() {
        _isLoading = false;
      });
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView(
        physics: isKeyboardOpen
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(
          left: Spacing.md,
          right: Spacing.md,
        ),
        children: [
          const SizedBox(height: Spacing.xl * 2),
          const Text(
            "Hi, Welcome Back! 👋",
            style: TextStyle(
              fontSize: FontSize.xxl,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: Spacing.sm),
          const Text(
            "Hello again, you've been missed !",
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
                  suffixIcon: showPassword ? HeroIcons.eyeSlash : HeroIcons.eye,
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
                      authController.navigateToForgetPassword();
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
                CustomButton(
                  title: "Login",
                  isLoading: _isLoading,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      handleLogin();
                    }
                  },
                ),
                const SizedBox(height: Spacing.lg),
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
                const SizedBox(height: Spacing.lg),
                Row(
                  children: [
                    // Login with Google
                    Expanded(
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
                          authController.navigateToAuth();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              height: 20,
                              width: 20,
                              'assets/images/google.png',
                            ),
                            const SizedBox(width: Spacing.sm),
                            const Text(
                              "Google",
                              style: TextStyle(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: Spacing.md,
                    ),
                    Expanded(
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
                          authController.navigateToAuth();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              height: 20,
                              width: 20,
                              'assets/images/facebook.png',
                            ),
                            const SizedBox(width: Spacing.sm),
                            const Text(
                              "Facebook",
                              style: TextStyle(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: Spacing.md),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Don't have an account ?",
              style: TextStyle(fontSize: FontSize.sm, color: AppColors.white),
            ),
            const SizedBox(width: Spacing.xs),
            GestureDetector(
              onTap: () {
                authController.navigateToSignup();
              },
              child: const Text(
                "Sign up",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
