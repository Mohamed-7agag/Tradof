
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import 'package:tradof/features/company/profile_company/presentation/logic/cubit/profile_company_cubit.dart';

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
      child: BlocBuilder<ProfileCompanyCubit, ProfileCompanyState>(
        builder: (context, state) {
          if (state.status == ProfileCompanyStatus.error) {
            return Text(state.errorMessage.toString());
          } else if (state.status == ProfileCompanyStatus.companyDataFetched) {
            return Column(
              children: [
                ProfileAppbar(companyModel: state.companyModel!),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        verticalSpace(15),
                        RatingAndReviews(
                          companyModel: state.companyModel!,
                        ),
                        verticalSpace(20),
                        SocialLinks(),
                        verticalSpace(20),
                        PreferredLanguage(
                          languages: state.companyModel!.preferredLanguages,
                        ),
                        verticalSpace(23),
                        IndustriesServed(
                          fileds: state.companyModel!.specializations,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return CustomLoadingWidget();
          }
        },
      ),
    );
  }
}
