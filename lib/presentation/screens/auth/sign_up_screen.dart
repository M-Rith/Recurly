import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recurly/app/routes/app_routes.dart';
import 'package:recurly/app/themes/spacing.dart';
import '../../../app/controllers/auth_controller.dart';
import '../../../app/themes/colors.dart';
import '../../../app/themes/font_size.dart';
import "package:heroicons/heroicons.dart";
import 'package:recurly/presentation/widgets/custom_text_field.dart';
import 'package:recurly/presentation/widgets/custom_button.dart';
import 'package:recurly/presentation/widgets/custom_snackbar.dart';
import 'package:recurly/app/data/models/status.dart';
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

  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  final TextEditingController displayNameController = TextEditingController();
  final FocusNode displayNameFocusNode = FocusNode();

  final AuthController authController = Get.find();
  bool _checkbox = false;
  bool _checkboxError = false;

  bool validateCheckbox() {
    print("Checkbox $_checkbox");
    setState(() {
      _checkboxError = !_checkbox;
    });
    return _checkbox;
  }

  bool showPassword = false;
  bool showConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    void handleSignUp() async {
      FocusScope.of(context).requestFocus(FocusNode());
      try {
        await authController.signUpWithEmailAndPasssword(
          emailController.text,
          passwordController.text,
          displayNameController.text,
        );
      } catch (e) {
        showCustomSnackbar(
          title: "Sign Up Failed",
          status: MessageStatus.error,
          message: e.toString(),
          context: context,
        ); // No semicolon here
      }
    }
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView(
        physics:
            isKeyboardOpen
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
                CustomizedTextField(
                  hintText: 'Display Name',
                  labelText: "Display Name",
                  prefixIcon: HeroIcons.user,
                  controller: displayNameController,
                  focusNode: displayNameFocusNode,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Display Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Spacing.md),
                CustomizedTextField(
                  hintText: 'Password',
                  labelText: 'Password',
                  prefixIcon: HeroIcons.lockClosed,
                  suffixIcon: showPassword ? HeroIcons.eyeSlash : HeroIcons.eye,
                  obscureText: !showPassword,
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    if (value != confirmPasswordController.text) {
                      return "Passwords don't match";
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
                CustomizedTextField(
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password',
                  prefixIcon: HeroIcons.lockClosed,
                  suffixIcon:
                      showConfirmPassword ? HeroIcons.eyeSlash : HeroIcons.eye,
                  controller: confirmPasswordController,
                  obscureText: !showConfirmPassword,
                  focusNode: confirmPasswordFocusNode,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    if (value != passwordController.text) {
                      return "Passwords don't match";
                    }
                    return null;
                  },
                  suffixIconAction: (value) {
                    setState(() {
                      showConfirmPassword = value;
                    });
                  },
                ),
                const SizedBox(height: Spacing.md),
                // checkbox
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Transform.scale(
                        scale: 1,
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: const VisualDensity(
                            horizontal: -4.0,
                            vertical: -4.0,
                          ),
                          side: const BorderSide(color: AppColors.secondary),
                          activeColor: AppColors.primary,
                          value: _checkbox,
                          onChanged: (value) {
                            setState(() {
                              _checkbox = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: Spacing.sm),
                    Text(
                      "I agree to the ",
                      style: TextStyle(
                        color:
                            _checkboxError ? AppColors.error : AppColors.secondary,
                        fontSize: FontSize.sm,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(AppRoutes.LOGIN);
                      },
                      child: Text(
                        "Terms and Conditions",
                        style: TextStyle(
                          color:
                              _checkboxError ? AppColors.error: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.lg),
                Obx(() {
                  return CustomButton(
                    title: "Sign Up",
                    isLoading: authController.isLoading.value,
                    onTap: () async {
                      setState(() {
                        final formValid = _formKey.currentState!.validate();
                        final checkboxValid = validateCheckbox();

                        if (formValid && checkboxValid) {
                          // You can call your auth logic here too
                          handleSignUp();
                        }
                      });
                    },
                  );
                }),
                const SizedBox(height: Spacing.lg),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColors.secondary, thickness: 1),
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
                      child: Divider(color: AppColors.secondary, thickness: 1),
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
                          Get.offAllNamed(AppRoutes.AUTH);
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
                              style: TextStyle(color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: Spacing.md),
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
                          Get.offAllNamed(AppRoutes.AUTH);
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
                              style: TextStyle(color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account ?",
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: FontSize.sm,
                      ),
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
