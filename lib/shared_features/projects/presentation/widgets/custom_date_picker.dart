// ignore_for_file: deprecated_member_use

import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

Future<DateTime?> customDatePicker(BuildContext context) {
  return showDatePickerDialog(
    context: context,
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),
    slidersColor: AppColors.primary,
    highlightColor: AppColors.primary.withOpacity(0.5),
    daysOfTheWeekTextStyle: AppStyle.robotoRegular12,
    enabledCellsTextStyle: AppStyle.robotoRegular14,
    disabledCellsTextStyle:
        AppStyle.robotoRegular14.copyWith(color: Colors.grey),
    currentDateDecoration: const BoxDecoration(
      color: AppColors.primary,
      shape: BoxShape.circle,
    ),
    currentDateTextStyle:
        AppStyle.poppinsMedium14.copyWith(color: AppColors.white),
    selectedCellDecoration: const BoxDecoration(
      color: AppColors.primary,
      shape: BoxShape.circle,
    ),
    leadingDateTextStyle: AppStyle.poppinsMedium14.copyWith(
      color: AppColors.primary,
    ),
  );
}
