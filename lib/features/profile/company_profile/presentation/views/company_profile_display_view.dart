import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../shared_widgets/profile_app_bar.dart';
import '../../../shared_widgets/profile_rating_and_reviews.dart';
import '../../../shared_widgets/social_media_section.dart';
import '../logic/company_profile_cubit/company_profile_cubit.dart';
import '../widgets/company_profile_tables.dart';

class CompanyProfileDisplayView extends StatelessWidget {
  const CompanyProfileDisplayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
        buildWhen: (previous, current) => _buildWhen(current),
        builder: (context, state) {
          if (state.status.isGetCompanySuccess) {
            return Column(
              children: [
                ProfileAppBar(
                  userId: state.companyModel!.id,
                  userName:
                      '${state.companyModel!.firstName} ${state.companyModel!.lastName}',
                  email: state.companyModel!.email,
                  extra: state.companyModel!.jobTitle,
                  userImageUrl: state.companyModel!.profileImageUrl,
                  isCompany: true,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          verticalSpace(16),
                          ProfileRatingAndReviews(
                            ratingSum: state.companyModel!.ratingSum,
                            reviewCount: state.companyModel!.reviewCount,
                          ),
                          if (state.companyModel!.socialMedia.isNotEmpty) ...[
                            verticalSpace(20),
                            SocialMediaSection(
                              userId: state.companyModel!.id,
                              socialMedia: state.companyModel!.socialMedia,
                              isFreeLancer: false,
                            ),
                          ],
                          verticalSpace(30),
                          SlideInUp(
                            from: 150,
                            child: CompanyProfileTables(
                              companyModel: state.companyModel!,
                            ),
                          ),
                          verticalSpace(50),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state.status.isGetCompanyFailure) {
            return CustomFailureWidget(text: state.errorMessage);
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }

  bool _buildWhen(CompanyProfileState current) {
    return current.status.isGetCompanySuccess ||
        current.status.isGetCompanyFailure ||
        current.status.isGetCompanyLoading;
  }
}
