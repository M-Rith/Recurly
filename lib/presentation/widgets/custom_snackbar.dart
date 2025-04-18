import 'package:flutter/material.dart';
import 'package:recurly/app/data/models/status.dart';
import 'package:recurly/app/themes/colors.dart';
import 'package:recurly/app/themes/font_size.dart';
import 'package:recurly/app/themes/spacing.dart';
import 'package:get/get.dart';

void showCustomSnackbar({
  required String title,
  required MessageStatus status,
  required String message,
  required BuildContext context,
}) {
  Color color;
  IconData icon;

  switch (status) {
    case MessageStatus.success:
      color = AppColors.success;
      icon = Icons.check_circle;
      break;
    case MessageStatus.error:
      color = AppColors.error;
      icon = Icons.error;
      break;
    case MessageStatus.warning:
      color = AppColors.warning;
      icon = Icons.warning;
      break;
    case MessageStatus.info:
    default:
      color = AppColors.info;
      icon = Icons.info_outline;
  }
  Get.snackbar(
    title,
    message,
    colorText: AppColors.white,
    icon: Icon(
      icon,
      size: FontSize.xxl,
      color: color,
    ),
    snackPosition: SnackPosition.BOTTOM,
  );
}
