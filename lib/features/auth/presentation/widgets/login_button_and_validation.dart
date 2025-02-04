import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/cache/cache_helper.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/utils/app_constants.dart';

import '../../../../core/helpers/app_regex.dart';
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
            context.goNamed(Routes.freelancerBottomNavBarViewRoute);
          } else {
            context.goNamed(Routes.companyBottomNavBarViewRoute);
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
      if (!AppRegex.isEmailValid(email)) {
        errorToast(context, 'Invalid Email', 'Please enter a valid email');
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
        context.read<AuthCubit>().login(email, password);
      }
    }
  }
}
