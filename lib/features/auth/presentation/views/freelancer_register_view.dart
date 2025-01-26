import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_drop_down_widget.dart';
import 'package:tradof/features/auth/presentation/widgets/create_account_curve_with_image.dart';
import 'package:tradof/features/auth/presentation/widgets/language_pair_table.dart';
import 'package:tradof/features/auth/presentation/widgets/specialization_table.dart';

class FreelancerRegisterView extends StatelessWidget {
  const FreelancerRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                text: 'Continue',
                color: AppColors.lightOrange,
                onPressed: () {},
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ],
    );
  }
}
