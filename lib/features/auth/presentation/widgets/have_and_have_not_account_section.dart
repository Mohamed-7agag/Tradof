import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/theming/font_weight_helper.dart';

class HaveNotAccountSection extends StatelessWidget {
  const HaveNotAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("haven't an Account?", style: AppStyle.robotoRegular12),
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.createAccountPageViewRoute);
          },
          child: Text(
            'Create Account',
            style: AppStyle.robotoRegular12.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class HaveAccountSection extends StatelessWidget {
  const HaveAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Have an Account?',
            style: AppStyle.robotoRegular12.copyWith(color: AppColors.white)),
        TextButton(
          onPressed: () {},
          child: Text(
            'Login',
            style: AppStyle.robotoRegular12.copyWith(
              color: AppColors.lightOrange,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ),
      ],
    );
  }
}
