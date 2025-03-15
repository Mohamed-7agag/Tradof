import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../profile/freelancer_profile/data/model/freelancer_model.dart';
import '../widgets/build_update_freelancer_profile_view.dart';

class UpdateFreelancerProfileView extends StatelessWidget {
  const UpdateFreelancerProfileView({required this.freelancerModel, super.key});
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Personal Info',
        actionIcon: HugeIcons.strokeRoundedPencilEdit02,
      ),
      body: BuildUpdateFreelancerProfileView(freelancerModel: freelancerModel),
    );
  }
}
