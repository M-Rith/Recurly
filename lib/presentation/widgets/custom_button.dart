import 'package:flutter/material.dart';
import 'package:recurly/app/themes/font_size.dart';
import 'package:recurly/app/themes/spacing.dart';
import 'package:recurly/app/themes/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool? isOutlined;
  final bool? isLoading;
  const CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.isOutlined = false,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) { 
    return SizedBox(
      width: double.infinity,
      height: Spacing.xxl,
      child: isOutlined == true
          ? OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: AppColors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Spacing.md),
                ),
                overlayColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory, // Disables splash effect
                // Ensure that there's no highlight color
                shadowColor: Colors.transparent,
              ),
              onPressed: () {
                onTap();
              },
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: FontSize.md,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isLoading == true ? Colors.white70 : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Spacing.md),
                  ),
                  overlayColor: Colors.transparent,
                  splashFactory:
                      NoSplash.splashFactory, // Disables splash effect
                  // Ensure that there's no highlight color
                  shadowColor: Colors.transparent),
              onPressed: () {
                isLoading == true ? null : onTap();
              },
              child: isLoading == false
                  ? Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: FontSize.md,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const SizedBox(
                      width: FontSize.md, // Set the width you want
                      height: FontSize.md, // Set the height you want
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                        strokeWidth: 4,
                      ),
                    ),
            ),
    );
  }
}
