import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

import '../../theming/app_colors.dart';
import '../../theming/app_style.dart';

// Convenience wrapper functions
void successToast(BuildContext context, String title, String description) {
  return _showToast(
    context: context,
    title: title,
    description: description,
    type: ToastificationType.success,
  );
}

void errorToast(BuildContext context, String title, String description) {
  return _showToast(
    context: context,
    title: title,
    description: description,
    type: ToastificationType.error,
  );
}

void warningToast(BuildContext context, String title, String description) {
  return _showToast(
    context: context,
    title: title,
    description: description,
    type: ToastificationType.warning,
  );
}

void infoToast(BuildContext context, String title, String description) {
  return _showToast(
    context: context,
    title: title,
    description: description,
    type: ToastificationType.info,
  );
}

void _showToast({
  required BuildContext context,
  required String title,
  required String description,
  required ToastificationType type,
}) {
  toastification.show(
    context: context,
    title: Text(title, style: AppStyle.poppinsSemiBold14),
    description: Text(
      description,
      style: AppStyle.robotoRegular14.copyWith(fontSize: 13.sp),
    ),
    type: type,
    style: ToastificationStyle.fillColored,
    animationDuration: const Duration(milliseconds: 600),
    autoCloseDuration: const Duration(seconds: 3),
    foregroundColor: AppColors.white,
    showProgressBar: false,
  );
}
