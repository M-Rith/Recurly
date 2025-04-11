import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recurly/app/routes/app_routes.dart';
import '../../../app/controllers/auth_controller.dart';
import '../../../app/themes/colors.dart';
import '../../../app/themes/font_size.dart';
import '../../../app/themes/spacing.dart';
import 'package:heroicons/heroicons.dart';
import 'package:recurly/presentation/widgets/custom_text_field.dart';

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
              "Login",
              style: TextStyle(
                fontSize: FontSize.xxl,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomizedTextField(
                    hintText: 'ronaldrichards@gmail.com',
                    labelText: 'Email',
                    prefixIcon: HeroIcons.envelope,
                    controller: emailController,
                    focusNode: emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!value.contains('@')) {
                        return 'Enter a valid email';
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
                    suffixIcon: HeroIcons.eye,
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
                        }
                        else {
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
            const SizedBox(
              height: Spacing.sm,
            ),
            const Text("Or continue with"),
            const SizedBox(
              height: Spacing.sm,
            ),
            const Spacer(),
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
            const SizedBox(
              height: Spacing.xl * 2,
            )
          ],
        ),
      ),
    );
  }
}
