import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../freelancer_profile/data/model/freelancer_model.dart';
import '../widgets/freelancer_dashboard_stack.dart';
import '../widgets/freelancer_profile_section.dart';

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
            child: FreelancerProfileSection(freelancerModel: freelancerModel),
          ),
          verticalSpace(15),
          const Expanded(
            child: FreelancerDashboardStack(),
          )
        ],
      ),
    );
  }
}
