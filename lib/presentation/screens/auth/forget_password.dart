import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:recurly/app/themes/spacing.dart';
import 'package:recurly/app/themes/font_size.dart';
import 'package:recurly/app/themes/colors.dart';
import 'package:recurly/presentation/widgets/custom_appbar.dart';
import 'package:recurly/presentation/widgets/custom_text_field.dart';
import '../../../app/controllers/auth_controller.dart';
import '../../../app/utils/email_validate.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

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
            CustomAppbar(
              preFixIcon: HeroIcons.arrowLeftCircle,
              preFixIconFunction: () {
                authController.navigateToLogin();
              },
              title: "Forget Password",
            ),
            const SizedBox(height: Spacing.sm),
            const Text(
              "Please enter your email address for verification process. we will send 6 digit code to your email.",
              style: TextStyle(fontSize: FontSize.sm, color: AppColors.white),
            ),
            const SizedBox(height: Spacing.xl),
            CustomizedTextField(
              hintText: "testing@gmail.com",
              labelText: "Email",
              prefixIcon: HeroIcons.envelope,
              controller: controller,
              focusNode: focusNode,
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

            const SizedBox(height: Spacing.sm),


          ],
        ),
      ),
    );
  }
}
