import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/features/company/profile_company/presentation/logic/company_profile_cubit/company_profile_cubit.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/company_profile_tables.dart';

import '../../../../../core/di/di.dart';
import '../widgets/profile_appbar.dart';
import '../widgets/rating_and_reviews.dart';
import '../widgets/social_links.dart';

class ProfileCompanyView extends StatelessWidget {
  const ProfileCompanyView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanyProfileCubit(getIt())..getCompanyProfile(),
      child: BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
        builder: (context, state) {
          if (state.status == CompanyProfileStatus.companyDataFetched) {
            return Column(
              children: [
                ProfileAppbar(companyModel: state.companyModel!),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          verticalSpace(15),
                          RatingAndReviews(
                            companyModel: state.companyModel!,
                          ),
                          if (state.companyModel!.socialMedia.isEmpty) ...[
                            verticalSpace(20),
                            SocialLinks(
                              socialLinks: state.companyModel!.socialMedia,
                            ),
                          ],
                          verticalSpace(26),
                          CompanyProfileTables(
                            companyModel: state.companyModel!,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state.status == CompanyProfileStatus.error) {
            return CustomFailureWidget(text: state.errorMessage);
          }
          return CustomLoadingWidget();
        },
      ),
    );
  }
}
