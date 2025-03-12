import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../shared_widgets/social_media_section.dart';
import '../../../shared_widgets/profile_app_bar.dart';
import '../../../shared_widgets/profile_rating_and_reviews.dart';
import '../../data/model/company_model.dart';
import '../widgets/company_profile_tables.dart';

class CompanyProfileView extends StatelessWidget {
  const CompanyProfileView({required this.companyModel, super.key});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileAppBar(
          userId: companyModel.id,
          userName: '${companyModel.firstName} ${companyModel.lastName}',
          email: companyModel.email,
          extra: companyModel.jobTitle,
          userImageUrl: companyModel.profileImageUrl,
          isCompany: true,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  verticalSpace(16),
                  ProfileRatingAndReviews(
                    ratingSum: companyModel.ratingSum,
                    reviewCount: companyModel.reviewCount,
                  ),
                  verticalSpace(20),
                  SocialMediaSection(
                    userId: companyModel.id,
                    socialMedia: companyModel.socialMedia,
                    isFreeLancer: false,
                  ),
                  verticalSpace(30),
                  SlideInUp(
                    from: 150,
                    child: CompanyProfileTables(companyModel: companyModel),
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
