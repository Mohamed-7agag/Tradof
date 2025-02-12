import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/cache/cache_helper.dart';
import 'package:tradof/core/helpers/app_validation.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/utils/app_constants.dart';

import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/auth_cubit/auth_cubit.dart';

class LoginButtonAndValidation extends StatelessWidget {
  const LoginButtonAndValidation({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status.isLogin) {
          if (CacheHelper.getString(AppConstants.role) == 'Freelancer') {
            context.pushNamedAndRemoveUntil(
              Routes.freelancerBottomNavBarViewRoute,
              predicate: (route) => false,
            );
          } else {
            context.pushNamedAndRemoveUntil(
              Routes.companyBottomNavBarViewRoute,
              predicate: (route) => false,
            );
          }
        } else if (state.status.isError) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Login',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _validateEmailAndPassword(context);
                },
              );
      },
    );
  }

  void _validateEmailAndPassword(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (formKey.currentState!.validate()) {
      if (AppValidation.emailValidation(context, email) &&
          AppValidation.passwordValidation(context, password)) {
        context.read<AuthCubit>().login(email, password);
      }
    }
  }
}
