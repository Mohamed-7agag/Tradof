import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/spacing.dart';

import '../../../../auth/presentation/logic/tables_cubit/tables_cubit.dart';
import '../widgets/industries_served.dart';
import '../widgets/preferred_language.dart';
import '../widgets/profile_appbar.dart';
import '../widgets/rating_and_reviews.dart';
import '../widgets/social_links.dart';

class ProfileCompanyView extends StatelessWidget {
  const ProfileCompanyView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TablesCubit(),
      child: Column(
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
