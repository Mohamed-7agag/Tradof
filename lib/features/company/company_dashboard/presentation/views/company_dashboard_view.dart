import 'package:flutter/material.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/company/company_dashboard/presentation/widgets/company_dashboard_stack.dart';

import '../../../company_profile/data/model/company_model.dart';
import '../widgets/profile_section.dart';

class CompanyDashboardView extends StatelessWidget {
  const CompanyDashboardView({super.key, required this.companyModel});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          verticalSpace(10),
          SafeArea(
            child: ProfileSection(companyModel: companyModel),
          ),
          verticalSpace(15),
          Expanded(
            child: CompanyDashboardStack(),
          )
        ],
      ),
    );
  }
}
