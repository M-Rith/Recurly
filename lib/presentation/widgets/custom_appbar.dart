import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:recurly/app/themes/colors.dart';
import 'package:recurly/app/themes/font_size.dart';
import 'package:recurly/app/themes/spacing.dart';

class CustomAppbar extends StatelessWidget {
  final Function? preFixIconFunction;
  final HeroIcons? preFixIcon;
  final String title;
  final Function? suffixIconFunction;
  final HeroIcons? suffixIcon;

  const CustomAppbar(
      {super.key,
      this.preFixIconFunction,
      this.preFixIcon,
      required this.title,
      this.suffixIconFunction,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left icon
        if (preFixIcon != null)
          GestureDetector(
            onTap: () {
              preFixIconFunction!();
            },
          child: HeroIcon(preFixIcon!, color: AppColors.white, size: FontSize.xxxl),
          )
        else
          const SizedBox(width: Spacing.xl ), // visual balance if no icon

        // Title
        Text(
          title,
          style: const TextStyle(
            fontSize: FontSize.xxl,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),

        // Right icon
        if (suffixIcon != null)
          GestureDetector(
            onTap: () {
              suffixIconFunction!();
            },
            child: HeroIcon(suffixIcon!, color: AppColors.white, size: FontSize.xxxl),
          )
        else
          const SizedBox(width: Spacing.xl),
      ],
    );
  }
}
