import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/helpers/app_validation.dart';
import 'package:tradof/core/helpers/extensions.dart';

import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/company_setting_cubit/company_setting_cubit.dart';

class ChangeCompanyPasswordButton extends StatelessWidget {
  const ChangeCompanyPasswordButton({
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.confirmPasswordController,
    super.key,
  });
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanySettingCubit(getIt()),
      child: BlocConsumer<CompanySettingCubit, CompanySettingState>(
        listenWhen: (previous, current) => _listenAndBuildWhen(current),
        buildWhen: (previous, current) => _listenAndBuildWhen(current),
        listener: (context, state) {
          if (state.status.isChangePasswordSuccess) {
            successToast(context, 'Success', state.message);
            context.pop();
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

  bool _listenAndBuildWhen(CompanySettingState current) {
    return current.status.isChangePasswordSuccess ||
        current.status.isChangePasswordFailure ||
        current.status.isChangePasswordLoading;
  }

  _validateAndConfirmNewPassword(BuildContext context) {
    final password = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();
    if (currentPasswordController.text.trim().isNullOrEmpty() ||
        password.isNullOrEmpty() ||
        confirmPassword.isNullOrEmpty()) {
      errorToast(context, 'Invalid Password', 'Please fill all fields');
    } else if (password != confirmPassword) {
      errorToast(context, 'Invalid Password', 'Passwords do not match');
    } else if (AppValidation.passwordValidation(context, password)) {
      context.read<CompanySettingCubit>().changeCompanyPassword(
            currentPassword: currentPasswordController.text.trim(),
            newPassword: password,
          );
    }
  }
}
