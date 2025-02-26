import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../logic/tables_cubit/tables_cubit.dart';
import '../widgets/country_drop_down_section.dart';
import '../widgets/create_account_curve_with_image.dart';
import '../widgets/freelancer_registeration_button.dart';
import '../widgets/language_pair_table.dart';
import '../widgets/specialization_table.dart';

class FreelancerRegisterView extends StatelessWidget {
  const FreelancerRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TablesCubit(),
      child: Column(
        children: [
          const CreateAccountCurveWithImage(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const CountryDropDownSection(),
                verticalSpace(28),
                SlideInLeft(
                  from: 400,
                  delay: const Duration(milliseconds: 125),
                  child: const LanguagePairTable(),
                ),
                verticalSpace(28),
                SlideInLeft(
                  from: 400,
                  delay: const Duration(milliseconds: 250),
                  child: const SpecializationTable(),
                ),
                verticalSpace(42),
                SlideInUp(
                  from: 400,
                  delay: const Duration(milliseconds: 375),
                  child: const FreelancerRegisterationButton(),
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
