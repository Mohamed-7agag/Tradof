import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/auth_cubit/auth_cubit.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.confirmPasswordController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController, confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status.isResetPassword) {
          successToast(context, 'Success', state.message);
          context.pop();
        } else if (state.status.isError) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isLoading
            ? const CustomLoadingWidget()
            : SlideInUp(
                from: 400,
                delay: Duration(milliseconds: 300),
                child: CustomButton(
                  text: 'Submit',
                  onPressed: () {
                    log('password: ${passwordController.text.trim()}');
                    log('confirmPassword: ${confirmPasswordController.text.trim()}');
                    FocusManager.instance.primaryFocus?.unfocus();
                    _validateAndConfirmNewPassword(context);
                  },
                ),
              );
      },
    );
  }

  void _validateAndConfirmNewPassword(BuildContext context) {
    final String password = passwordController.text.trim();
    final String confirmPassword = confirmPasswordController.text.trim();
    if (formKey.currentState!.validate()) {
      if (password != confirmPassword) {
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
        context.read<AuthCubit>().resetPassword(password);
      }
    }
  }
}
