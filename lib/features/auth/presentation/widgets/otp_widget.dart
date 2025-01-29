import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key, required this.onSubmit});
  final void Function(String pin)? onSubmit;
  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 6,
      enabledBorderColor: AppColors.grey,
      //autoFocus: true,
      cursorColor: AppColors.primary,
      borderRadius: BorderRadius.circular(12),
      fieldWidth: MediaQuery.sizeOf(context).width / 8,
      showFieldAsBox: true,
      contentPadding: EdgeInsets.symmetric(vertical: 18.h),
      textStyle: AppStyle.robotoBold20,
      focusedBorderColor: AppColors.primary,
      onSubmit: onSubmit,
    );
  }
}
