import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../company_profile/data/model/company_model.dart';
import '../widgets/company_dashboard_stack.dart';
import '../widgets/company_dashboard_profile_section.dart';

class CompanyDashboardView extends StatelessWidget {
  const CompanyDashboardView({required this.companyModel, super.key});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Column(
        children: [
          verticalSpace(10),
          SafeArea(
            child: CompanyDashboardProfileSection(
              companyModel: companyModel,
            ),
          ),
          verticalSpace(15),
          Expanded(
            child: CompanyDashboardStack(
              companyModel: companyModel,
            ),
          )
        ],
      ),
    );
  }
}
