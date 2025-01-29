import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_drop_down_widget.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import 'package:tradof/features/auth/presentation/widgets/create_account_curve_with_image.dart';
import 'package:tradof/features/auth/presentation/widgets/language_pair_table.dart';
import 'package:tradof/features/auth/presentation/widgets/specialization_table.dart';

import '../../../../core/routing/routes.dart';

class FreelancerRegisterView extends StatelessWidget {
  const FreelancerRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TablesCubit(),
      child: Column(
        children: [
          CreateAccountCurveWithImage(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SlideInRight(
                  from: 400,
                  child: CustomDropDownWidget(
                    hint: 'Country',
                    items: ['USA', 'UK', 'Canada'],
                    onChanged: (value) {},
                  ),
                ),
                verticalSpace(28),
                SlideInLeft(
                    from: 400,
                    delay: Duration(milliseconds: 125),
                    child: LanguagePairTable()),
                verticalSpace(28),
                SlideInLeft(
                    from: 400,
                    delay: Duration(milliseconds: 250),
                    child: SpecializationTable()),
                verticalSpace(42),
                SlideInUp(
                  from: 400,
                  delay: Duration(milliseconds: 375),
                  child: CustomButton(
                    text: 'Submit',
                    color: AppColors.lightOrange,
                    onPressed: () {
                      context.pushNamed(Routes.verificationViewRoute);
                    },
                  ),
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
