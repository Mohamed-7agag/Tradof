import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_drop_down_widget.dart';
import 'package:tradof/features/auth/presentation/logic/cubit/create_account_cubit.dart';
import 'package:tradof/features/auth/presentation/widgets/create_account_curve_with_image.dart';
import 'package:tradof/features/auth/presentation/widgets/language_pair_table.dart';
import 'package:tradof/features/auth/presentation/widgets/specialization_table.dart';

import '../../../../core/routing/routes.dart';

class FreelancerRegisterView extends StatelessWidget {
  const FreelancerRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAccountCubit(),
      child: Column(
        children: [
          CreateAccountCurveWithImage(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                CustomDropDownWidget(
                  hint: 'Country',
                  items: ['USA', 'UK', 'Canada'],
                ),
                verticalSpace(35),
                LanguagePairTable(),
                verticalSpace(35),
                SpecializationTable(),
                verticalSpace(40),
                CustomButton(
                  text: 'Submit',
                  color: AppColors.lightOrange,
                  onPressed: () {
                    context.pushNamed(Routes.verificationViewRoute);
                  },
                ),
                verticalSpace(20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
