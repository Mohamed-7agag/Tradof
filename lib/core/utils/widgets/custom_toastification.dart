// import 'package:flutter/material.dart';
// import 'package:toastification/toastification.dart';

// import '../../theming/app_colors.dart';
// import '../../theming/app_style.dart';

// successToast(BuildContext context, String title, String description) {
//   return toastification.show(
//     context: context,
//     title: Text(
//       title,
//       style: AppStyle.styleBold13,
//     ),
//     description: Text(
//       description,
//       style: AppStyle.styleRegular13.copyWith(color: AppColors.white),
//     ),
//     type: ToastificationType.success,
//     style: ToastificationStyle.fillColored,
//     autoCloseDuration: const Duration(milliseconds: 3500),
//     animationDuration: const Duration(milliseconds: 600),
//     showProgressBar: false,
//   );
// }

// errorToast(BuildContext context, String title, String description) {
//   return toastification.show(
//     context: context,
//     title: Text(
//       title,
//       style: AppStyle.styleBold13,
//     ),
//     description: Text(
//       description,
//       style: AppStyle.styleRegular13.copyWith(color: AppColors.white),
//     ),
//     type: ToastificationType.error,
//     style: ToastificationStyle.fillColored,
//     autoCloseDuration: const Duration(milliseconds: 3500),
//     animationDuration: const Duration(milliseconds: 600),
//     showProgressBar: false,
//   );
// }

// warningToast(BuildContext context, String title, String description) {
//   return toastification.show(
//     context: context,
//     title: Text(
//       title,
//       style: AppStyle.styleBold13,
//     ),
//     description: Text(
//       description,
//       style: AppStyle.styleRegular13.copyWith(color: AppColors.white),
//     ),
//     type: ToastificationType.warning,
//     style: ToastificationStyle.fillColored,
//     autoCloseDuration: const Duration(milliseconds: 3500),
//     animationDuration: const Duration(milliseconds: 600),
//     showProgressBar: false,
//   );
// }

// infoToast(BuildContext context, String title, String description) {
//   return toastification.show(
//     context: context,
//     title: Text(
//       title,
//       style: AppStyle.styleBold13,
//     ),
//     description: Text(
//       description,
//       style: AppStyle.styleRegular13.copyWith(color: AppColors.white),
//     ),
//     type: ToastificationType.info,
//     style: ToastificationStyle.fillColored,
//     autoCloseDuration: const Duration(milliseconds: 3500),
//     animationDuration: const Duration(milliseconds: 600),
//     showProgressBar: false,
//   );
// }