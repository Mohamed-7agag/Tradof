import 'package:flutter/material.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';

import '../widgets/freelancer_dashboard_stack.dart';
import '../widgets/freelancer_profile_section.dart';

class FreelancerDashboardView extends StatelessWidget {
  const FreelancerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          verticalSpace(10),
          SafeArea(
            child: FreelancerProfileSection(),
          ),
          verticalSpace(15),
          Expanded(
            child: FreelancerDashboardStack(),
          )
        ],
      ),
    );
  }
}
