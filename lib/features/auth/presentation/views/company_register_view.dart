import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/widgets/custom_text_field.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import 'package:tradof/features/auth/presentation/widgets/country_drop_down_section.dart';
import 'package:tradof/features/auth/presentation/widgets/industries_served_table.dart';
import 'package:tradof/features/auth/presentation/widgets/prefered_languages_table.dart';
import 'package:tradof/features/auth/presentation/widgets/profile_image_section.dart';

import '../logic/freelancer_registeration_cubit.dart';
import '../widgets/company_registeration_button.dart';

class CompanyRegisterView extends StatefulWidget {
  const CompanyRegisterView({super.key});

  @override
  State<CompanyRegisterView> createState() => _CompanyRegisterViewState();
}

class _CompanyRegisterViewState extends State<CompanyRegisterView> {
  late final TextEditingController jobTitleController;
  late final TextEditingController locationCompanyController;
  @override
  void initState() {
    jobTitleController = TextEditingController();
    locationCompanyController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    jobTitleController.dispose();
    locationCompanyController.dispose();
    super.dispose();
  }

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
                SlideInRight(
                  from: 400,
                  child: CustomTextField(
                    labelText: 'Job Title',
                    labelColor: AppColors.white,
                    controller: jobTitleController,
                    keyboardType: TextInputType.text,
                    outlineBorder: true,
                  ),
                ),
                verticalSpace(12),
                CountryDropDownSection(),
                verticalSpace(12),
                SlideInRight(
                  from: 400,
                  delay: Duration(milliseconds: 250),
                  child: CustomTextField(
                    labelText: 'Location Company',
                    labelColor: AppColors.white,
                    controller: locationCompanyController,
                    keyboardType: TextInputType.text,
                    outlineBorder: true,
                  ),
                ),
                verticalSpace(28),
                SlideInLeft(
                  from: 400,
                  delay: Duration(milliseconds: 375),
                  child: PreferedLanguagesTable(),
                ),
                verticalSpace(28),
                SlideInLeft(
                  from: 400,
                  delay: Duration(milliseconds: 500),
                  child: IndustriesServedTable(),
                ),
                verticalSpace(40),
                BlocBuilder<ProfileImageAndCountryCubit,
                    ProfileImageAndCountryState>(
                  builder: (context, state) {
                    return SlideInUp(
                      from: 400,
                      delay: Duration(milliseconds: 625),
                      child: CompanyRegisterationButton(
                        countryId: state.countryId,
                        imageUrl: state.imagePicked,
                        jobTitleController: jobTitleController,
                        locationCompanyController: locationCompanyController,
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
