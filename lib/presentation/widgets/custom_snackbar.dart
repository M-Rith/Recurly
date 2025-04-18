import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:recurly/app/data/models/status.dart';
import 'package:recurly/app/themes/colors.dart';
import 'package:recurly/app/themes/font_size.dart';
import 'package:recurly/app/themes/spacing.dart';

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

  Flushbar(
    title: title,
    message: message,
    backgroundColor: AppColors.card.withOpacity(0.4) ,
    icon: Icon(
      icon,
      size: FontSize.xxl,
      color: color,
    ),
    duration: const Duration(seconds: 3),
    leftBarIndicatorColor: color,
    margin: EdgeInsets.all(Spacing.sm),
    borderRadius: BorderRadius.circular(Spacing.sm),
    flushbarPosition: FlushbarPosition.BOTTOM,
  ).show(context);
}

