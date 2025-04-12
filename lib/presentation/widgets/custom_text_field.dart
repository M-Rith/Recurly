import 'package:flutter/material.dart';
import '../../app/themes/colors.dart';
import '../../app/themes/font_size.dart';
import '../../app/themes/spacing.dart';
import 'package:heroicons/heroicons.dart';

class CustomizedTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final HeroIcons prefixIcon;
  final HeroIcons? suffixIcon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final bool? obscureText;
  final void Function(bool)? suffixIconAction;
  const CustomizedTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    required this.focusNode,
    required this.keyboardType,
    required this.validator,
    this.obscureText,
    this.suffixIconAction,
  });

  @override
  State<CustomizedTextField> createState() => _CustomizedTextFieldState();
}

class _CustomizedTextFieldState extends State<CustomizedTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText == null ? false : widget.obscureText!,
      onChanged: (value) {
        widget.controller.text = value;
      },
      validator: widget.validator, // <- attach validator
      decoration: InputDecoration(
        prefixIcon: HeroIcon(widget.prefixIcon, color: AppColors.white),
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          fontSize: FontSize.sm,
          color: AppColors.white,
        ),
        suffixIcon: widget.suffixIcon == null
            ? null
        : IconButton(
            onPressed: () {
              widget.suffixIconAction!(widget.obscureText!);
            },
            icon: HeroIcon(widget.suffixIcon!, color: AppColors.white),
          ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: FontSize.sm,
          color: AppColors.accent,
        ),
        filled: true,
        fillColor: AppColors.background,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Spacing.md,
          vertical: Spacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.white,
            width: 1.5,
          ),
        ),
      ),
      style: const TextStyle(
        fontSize: FontSize.sm,
        color: AppColors.white,
      ),
      keyboardType: widget.keyboardType,
    );
  }
}
