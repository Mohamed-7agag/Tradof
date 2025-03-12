import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../profile/freelancer_profile/data/model/freelancer_model.dart';
import '../../../shared_widgets/dashboard_list_tile.dart';
import '../../../shared_widgets/dashboard_stack.dart';

class FreelancerDashboardView extends StatelessWidget {
  const FreelancerDashboardView({
    required this.freelancerModel,
    super.key,
  });
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Column(
        children: [
          verticalSpace(10),
          SafeArea(
            child: DashboardListTile(
              userName:
                  '${freelancerModel.firstName} ${freelancerModel.lastName}',
              email: freelancerModel.email,
              profileImageUrl: freelancerModel.profileImageUrl,
            ),
          ),
          verticalSpace(15),
          const Expanded(child: DashboardStack()),
        ],
      ),
    );
  }
}
