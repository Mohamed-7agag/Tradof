import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/features/company/profile_company/data/model/company_model.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';

class UpdateCompanyProfileTablesView extends StatelessWidget {
  const UpdateCompanyProfileTablesView({
    super.key,
    required this.companyModel,
  });
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Update Profile Info',
          style: AppStyle.robotoBold20.copyWith(color: AppColors.white),
        ),
        actions: [
          SvgPicture.asset('assets/images/edit.svg', width: 26),
          horizontalSpace(16),
        ],
        toolbarHeight: 65,
      ),
    );
  }
}
