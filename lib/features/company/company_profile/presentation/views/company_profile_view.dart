import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';

import '../../data/model/company_model.dart';
import '../widgets/company_profile_tables.dart';
import '../widgets/company_rating_and_reviews.dart';
import '../widgets/company_social_links.dart';
import '../widgets/company_profile_appbar.dart';

class ProfileCompanyView extends StatelessWidget {
  const ProfileCompanyView({super.key, required this.companyModel});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CompanyProfileAppbar(companyModel: companyModel),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  verticalSpace(16),
                  CompanyRatingAndReviews(companyModel: companyModel),
                  verticalSpace(20),
                  CompanySocialLinks(
                    socialMedia: companyModel.socialMedia,
                  ),
                  verticalSpace(26),
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
