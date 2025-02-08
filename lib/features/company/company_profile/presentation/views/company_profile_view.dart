import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';

import '../../data/model/company_model.dart';
import '../widgets/company_profile_tables.dart';
import '../widgets/profile_appbar.dart';
import '../widgets/rating_and_reviews.dart';
import '../widgets/social_links.dart';

class ProfileCompanyView extends StatelessWidget {
  const ProfileCompanyView({super.key, required this.companyModel});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return BuildCompanyProfileSuccess(companyModel: companyModel);
  }
}

class BuildCompanyProfileSuccess extends StatelessWidget {
  const BuildCompanyProfileSuccess({
    super.key,
    required this.companyModel,
  });

  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileAppbar(companyModel: companyModel),
        Expanded(
            child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      verticalSpace(16),
                      RatingAndReviews(companyModel: companyModel),
                      verticalSpace(20),
                      SocialLinks(
                        socialMedia: companyModel.socialMedia,
                      ),
                      verticalSpace(26),
                      SlideInUp(
                        from: 150,
                        child: CompanyProfileTables(companyModel: companyModel),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )),
      ],
    );
  }
}
