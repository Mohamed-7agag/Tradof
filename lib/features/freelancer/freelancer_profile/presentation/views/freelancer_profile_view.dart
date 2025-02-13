import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';

import '../../data/model/freelancer_model.dart';
import '../widgets/freelancer_cv_section.dart';
import '../widgets/freelancer_profile_app_bar.dart';
import '../widgets/freelancer_profile_tables.dart';
import '../widgets/freelancer_rating_and_review.dart';
import '../widgets/freelancer_social_media.dart';

class FreelancerProfileView extends StatelessWidget {
  const FreelancerProfileView({super.key, required this.freelancerModel});
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
                  FreelancerSocialMedia(
                    socialMedia: freelancerModel.socialMedias,
                  ),
                  verticalSpace(30),
                  FreelancerProfileTables(freelancerModel: freelancerModel),
                  verticalSpace(26),
                  SlideInUp(
                    from: 200,
                    child:
                        FreelancerCvSection(cvUrl: freelancerModel.cvFilePath),
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
