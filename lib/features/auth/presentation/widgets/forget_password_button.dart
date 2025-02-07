import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/app_validation.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/features/auth/presentation/logic/auth_cubit/auth_cubit.dart';

import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
    required this.emailController,
    required this.pageController,
  });
  final TextEditingController emailController;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status.isForgotPassword) {
          successToast(context, 'Success', state.message);
          pageController.nextPage(
            duration: Duration(milliseconds: 350),
            curve: Curves.easeInOut,
          );
        } else if (state.status.isError) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Continue',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (AppValidation.emailValidation(
                      context, emailController.text.trim())) {
                    context.read<AuthCubit>().forgetPassword(
                          emailController.text.trim(),
                        );
                  }
                },
              );
      },
    );
  }
}
