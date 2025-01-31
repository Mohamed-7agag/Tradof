import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';

import 'package:tradof/features/company/profile_company/presentation/widgets/industries_served.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/preferred_language.dart';

import 'package:tradof/features/company/profile_company/presentation/widgets/profile_appbar.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/rating_and_reviews.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/social_links.dart';

class ProfileCompanyView extends StatelessWidget {
  const ProfileCompanyView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TablesCubit(),
      child: Expanded(
        child: Column(
          children: [
            ProfileAppbar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpace(15),
                    RatingAndReviews(),
                    verticalSpace(20),
                    SocialLinks(),
                    verticalSpace(20),
                    //  PreferredLanguage(),
                    verticalSpace(23),
                    IndustriesServed(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
