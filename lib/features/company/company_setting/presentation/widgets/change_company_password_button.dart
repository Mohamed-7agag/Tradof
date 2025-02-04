import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/helpers/extensions.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/cubit/company_setting_cubit.dart';

class ChangeCompanyPasswordButton extends StatelessWidget {
  const ChangeCompanyPasswordButton({
    super.key,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });
  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanySettingCubit(getIt()),
      child: BlocConsumer<CompanySettingCubit, CompanySettingState>(
        listener: (context, state) {
          if (state.status.isChangePasswordSuccess) {
            successToast(context, 'Success', state.message);
          } else if (state.status.isChangePasswordFailure) {
            errorToast(context, 'Error', state.errMessage);
          }
        },
        builder: (context, state) {
          return state.status.isChangePasswordLoading
              ? const CustomLoadingWidget()
              : CustomButton(
                  text: 'Change',
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    _validateAndConfirmNewPassword(context);
                  },
                );
        },
      ),
    );
  }

  _validateAndConfirmNewPassword(BuildContext context) {
    final password = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();
    if (oldPasswordController.text.trim().isNullOrEmpty() ||
        password.isNullOrEmpty() ||
        confirmPassword.isNullOrEmpty()) {
      errorToast(context, 'Invalid Password', 'Please fill all fields');
    } else if (password != confirmPassword) {
      errorToast(context, 'Invalid Password', 'Passwords do not match');
    } else if (!AppRegex.hasMinLength(password)) {
      errorToast(context, 'Invalid Password',
          'Password must be at least 8 characters long');
    } else if (!AppRegex.hasLowerCase(password)) {
      errorToast(context, 'Invalid Password',
          'Password must contain at least one lowercase letter');
    } else if (!AppRegex.hasUpperCase(password)) {
      errorToast(context, 'Invalid Password',
          'Password must contain at least one upper letter');
    } else if (!AppRegex.hasNumber(password)) {
      errorToast(context, 'Invalid Password',
          'Password must contain at least one number digit');
    } else if (!AppRegex.hasSpecialCharacter(password)) {
      errorToast(context, 'Invalid Password',
          'Password must contain at least one special character');
    } else {
      // context.read<CompanySettingCubit>().changeCompanyPassword(
      //       oldPassword: oldPasswordController.text.trim(),
      //       newPassword: password,
      //     );
    }
  }
}
