import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/features/auth/presentation/widgets/industries_served_table.dart';
import 'package:tradof/features/auth/presentation/widgets/prefered_languages_table.dart';
import 'package:tradof/features/company/profile_company/data/model/company_model.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/update_company_profile_tables_button.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';

class UpdateCompanyProfileTablesView extends StatelessWidget {
  const UpdateCompanyProfileTablesView({super.key, required this.companyModel});
  final CompanyModel companyModel;
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
              PreferedLanguagesTable(darkColors: true),
              verticalSpace(24),
              IndustriesServedTable(darkColors: true),
              verticalSpace(40),
              UpdateCompanyProfileTablesButton(companyModel: companyModel),
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
