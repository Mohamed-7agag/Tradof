import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/custom_url_launcher.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/auth_cubit/auth_cubit.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status.isGoogleLogin) {
          // context.pushNamedAndRemoveUntil(
          //   CacheHelper.getString(AppConstants.role) == 'Freelancer'
          //       ? Routes.freelancerBottomNavBarViewRoute
          //       : Routes.companyBottomNavBarViewRoute,
          //   predicate: (route) => false,
          // );
        } else if (state.status.isGoogleLoginFailure) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isGoogleLoginLoading
            ? const CustomLoadingWidget()
            : ElevatedButton.icon(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  // context.read<AuthCubit>().loginWithGoogle();
                  await customUrlLauncher(context,
                      'https://tradof.runasp.net/api/auth/google-login');
                },
                label: Text('Sign in with Google',
                    style: AppStyle.poppinsMedium14),
                iconAlignment: IconAlignment.end,
                icon: Image.asset('assets/images/google.png', width: 26),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.background,
                  elevation: 0,
                  foregroundColor: AppColors.primary,
                  fixedSize: Size(1.sw, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side:
                        const BorderSide(color: AppColors.primary, width: 1.2),
                  ),
                ),
              );
      },
    );
  }
}
