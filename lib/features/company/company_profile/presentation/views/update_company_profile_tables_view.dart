import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/features/auth/presentation/widgets/industries_served_table.dart';
import 'package:tradof/features/auth/presentation/widgets/prefered_languages_table.dart';
import 'package:tradof/features/company/company_profile/data/model/company_model.dart';
import 'package:tradof/features/company/company_profile/presentation/widgets/update_company_profile_tables_button.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';
import '../logic/company_profile_cubit/company_profile_cubit.dart';

class UpdateCompanyProfileTablesView extends StatelessWidget {
  const UpdateCompanyProfileTablesView({
    super.key,
    required this.companyModel,
    required this.isPreferedLanguages,
  });
  final CompanyModel companyModel;
  final bool isPreferedLanguages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(16),
              isPreferedLanguages
                  ? PreferedLanguagesTable(darkColors: true)
                  : IndustriesServedTable(darkColors: true),
              verticalSpace(40),
              BlocProvider(
                create: (context) => CompanyProfileCubit(getIt()),
                child: UpdateCompanyProfileTablesButton(
                  companyModel: companyModel,
                ),
              ),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      leadingWidth: 40,
      title: Text(
        'Update Profile Info',
        style: AppStyle.robotoBold20.copyWith(color: AppColors.white),
      ),
      actions: [
        SvgPicture.asset('assets/images/edit.svg', width: 24),
        horizontalSpace(16),
      ],
      toolbarHeight: 65,
    );
  }
}
