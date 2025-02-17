import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../logic/auth_cubit/auth_cubit.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key});
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
      onSubmit: (pin) {
        context.read<AuthCubit>().setOtp(pin);
      },
    );
  }
}
