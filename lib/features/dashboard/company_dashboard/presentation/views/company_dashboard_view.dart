import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../profile/company_profile/data/model/company_model.dart';
import '../../../shared_widgets/dashboard_list_tile.dart';
import '../../../shared_widgets/dashboard_stack.dart';

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
            child: DashboardListTile(
              userName: '${companyModel.firstName} ${companyModel.lastName}',
              email: companyModel.email,
              profileImageUrl: companyModel.profileImageUrl,
            ),
          ),
          verticalSpace(15),
          Expanded(
            child: DashboardStack(companyModel: companyModel),
          )
        ],
      ),
    );
  }
}
