import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_loading_dialog.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/auth_cubit/auth_cubit.dart';

class ResendOtpSection extends StatelessWidget {
  const ResendOtpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status.isResendOtp) {
          context.pop();
          successToast(context, 'Success', state.message);
        } else if (state.status.isError) {
          context.pop();
          errorToast(context, 'Error', state.errorMessage);
        } else if (state.status.isLoading) {
          loadingDialog(context);
        }
      },
      child: GestureDetector(
        onTap: () => context.read<AuthCubit>().resendOtp(),
        child: Text(
          'Resend OTP',
          style: AppStyle.robotoRegular12.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
