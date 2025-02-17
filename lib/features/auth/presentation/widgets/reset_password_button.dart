import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/app_validation.dart';
import 'package:tradof/core/helpers/extensions.dart';

import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/auth_cubit/auth_cubit.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    required this.formKey,
    required this.passwordController,
    required this.confirmPasswordController,
    super.key,
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
                delay: const Duration(milliseconds: 300),
                child: CustomButton(
                  text: 'Submit',
                  onPressed: () {
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
      } else if (AppValidation.passwordValidation(context, password)) {
        context.read<AuthCubit>().resetPassword(password);
      }
    }
  }
}
