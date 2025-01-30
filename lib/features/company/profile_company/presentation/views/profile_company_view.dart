import 'package:flutter/material.dart';

import 'package:tradof/core/helpers/spacing.dart';

import 'package:tradof/features/company/profile_company/presentation/widgets/industries_served.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/preferred_language.dart';

import 'package:tradof/features/company/profile_company/presentation/widgets/profile_appbar.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/rating_and_reviews.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/social_links.dart';

class ProfileCompanyView extends StatelessWidget {
  const ProfileCompanyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileAppbar(),
          verticalSpace(15),
          RatingAndReviews(),
          verticalSpace(20),
          SocialLinks(),
          verticalSpace(20),
          PreferredLanguage(),
          verticalSpace(23),
          IndustriesServed(),
        ],
      ),
    );
  }
}

