import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import 'package:tradof/features/auth/presentation/widgets/country_drop_down_section.dart';
import 'package:tradof/features/auth/presentation/widgets/language_pair_table.dart';
import 'package:tradof/features/auth/presentation/widgets/specialization_table.dart';

import '../logic/freelancer_registeration_cubit.dart';
import '../widgets/freelancer_registeration_button.dart';
import '../widgets/profile_image_section.dart';

class FreelancerRegisterView extends StatelessWidget {
  const FreelancerRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TablesCubit()),
        BlocProvider(create: (context) => ProfileImageAndCountryCubit()),
      ],
      child: Column(
        children: [
          ProfileImageSection(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                CountryDropDownSection(),
                verticalSpace(28),
                SlideInLeft(
                  from: 400,
                  delay: Duration(milliseconds: 125),
                  child: LanguagePairTable(),
                ),
                verticalSpace(28),
                SlideInLeft(
                  from: 400,
                  delay: Duration(milliseconds: 250),
                  child: SpecializationTable(),
                ),
                verticalSpace(42),
                BlocBuilder<ProfileImageAndCountryCubit,
                    ProfileImageAndCountryState>(
                  builder: (context, state) {
                    return SlideInUp(
                      from: 400,
                      delay: Duration(milliseconds: 375),
                      child: FreelancerRegisterationButton(
                        countryId: state.countryId,
                        imageUrl: state.imagePicked,
                      ),
                    );
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
