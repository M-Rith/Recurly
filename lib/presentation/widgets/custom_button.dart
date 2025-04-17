import 'package:flutter/material.dart';
import 'package:recurly/app/themes/font_size.dart';
import 'package:recurly/app/themes/spacing.dart';
import 'package:recurly/app/themes/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool? isOutlined;
  const CustomButton(
      {super.key, required this.title, required this.onTap, this.isOutlined = false });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: isOutlined == true
          ? OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: AppColors.white),
                padding: const EdgeInsets.symmetric(vertical: Spacing.md),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Spacing.md),
                ),
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
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: Spacing.md),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Spacing.md),
                ),
              ),
              onPressed: () {
                onTap();
              },
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: FontSize.md,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
