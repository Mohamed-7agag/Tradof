import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../freelancer_features/freelancer_profile/presentation/widgets/social_media_section.dart';
import '../logic/company_profile_cubit/company_profile_cubit.dart';
import '../widgets/company_profile_appbar.dart';
import '../widgets/company_profile_tables.dart';
import '../widgets/company_rating_and_reviews.dart';

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
                CompanyProfileAppbar(companyModel: state.companyModel!),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          verticalSpace(16),
                          CompanyRatingAndReviews(
                            companyModel: state.companyModel!,
                          ),
                          verticalSpace(20),
                          SocialMediaSection(
                            userId: state.companyModel!.id,
                            socialMedia: state.companyModel!.socialMedia,
                            isFreeLancer: false,
                          ),
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
