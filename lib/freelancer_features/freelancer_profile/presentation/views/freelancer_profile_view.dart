import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../data/model/freelancer_model.dart';
import '../widgets/freelancer_cv_section.dart';
import '../widgets/freelancer_profile_app_bar.dart';
import '../widgets/freelancer_profile_tables.dart';
import '../widgets/freelancer_rating_and_review.dart';
import '../widgets/social_media_section.dart';

class FreelancerProfileView extends StatelessWidget {
  const FreelancerProfileView({required this.freelancerModel, super.key});
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FreelancerProfileAppBar(freelancerModel: freelancerModel),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  verticalSpace(16),
                  FreelancerRatingAndReview(freelancerModel: freelancerModel),
                  verticalSpace(20),
                  SocialMediaSection(
                    userId: freelancerModel.userId,
                    socialMedia: freelancerModel.socialMedias,
                    isFreeLancer: true,
                  ),
                  verticalSpace(30),
                  FreelancerProfileTables(freelancerModel: freelancerModel),
                  verticalSpace(26),
                  SlideInUp(
                    from: 200,
                    child: FreelancerCvSection(
                      cvUrl: freelancerModel.cvFilePath,
                      freelancerId: freelancerModel.userId,
                    ),
                  ),
                  verticalSpace(100),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
