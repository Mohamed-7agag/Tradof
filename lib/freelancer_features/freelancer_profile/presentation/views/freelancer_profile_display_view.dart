import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';
import '../widgets/freelancer_cv_section.dart';
import '../widgets/freelancer_profile_app_bar.dart';
import '../widgets/freelancer_profile_tables.dart';
import '../widgets/freelancer_rating_and_review.dart';
import '../widgets/freelancer_social_media.dart';

class FreelancerProfileDisplayView extends StatelessWidget {
  const FreelancerProfileDisplayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FreelancerProfileCubit, FreelancerProfileState>(
        buildWhen: (previous, current) => _buildWhen(current),
        builder: (context, state) {
          if (state.status.isGetFreelancerSuccess) {
            return Column(
              children: [
                FreelancerProfileAppBar(
                  freelancerModel: state.freelancerModel!,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          verticalSpace(16),
                          FreelancerRatingAndReview(
                            freelancerModel: state.freelancerModel!,
                          ),
                          verticalSpace(20),
                          FreelancerSocialMedia(
                            freelancerModel: state.freelancerModel!,
                          ),
                          verticalSpace(30),
                          FreelancerProfileTables(
                            freelancerModel: state.freelancerModel!,
                          ),
                          if (!state.freelancerModel!.cvFilePath
                              .isNullOrEmpty()) ...[
                            verticalSpace(26),
                            SlideInUp(
                              from: 200,
                              child: FreelancerCvSection(
                                cvUrl: state.freelancerModel!.cvFilePath,
                                freelancerId: state.freelancerModel!.userId,
                              ),
                            ),
                          ],
                          verticalSpace(50),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          } else if (state.status.isGetFreelancerFailure) {
            return CustomFailureWidget(text: state.errMessage);
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }

  bool _buildWhen(FreelancerProfileState current) {
    return current.status.isGetFreelancerSuccess ||
        current.status.isGetFreelancerFailure ||
        current.status.isGetFreelancerLoading;
  }
}
