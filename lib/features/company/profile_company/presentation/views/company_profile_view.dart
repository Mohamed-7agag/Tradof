import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/core/utils/widgets/custom_refresh_indicator.dart';

import '../../../../../core/di/di.dart';
import '../../data/model/company_model.dart';
import '../logic/company_profile_cubit/company_profile_cubit.dart';
import '../widgets/company_profile_tables.dart';
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
          return CustomRefreshIndicator(
            reversColors: true,
            onRefresh: () async {
              if (state.companyModel != null) return;
              context.read<CompanyProfileCubit>().getCompanyProfile();
            },
            child: state.status.isGetCompanyloading
                ? const CustomLoadingWidget()
                : state.status.isGetCompanyFailure
                    ? ListView(
                        itemExtent: 1.sh,
                        children: [
                          CustomFailureWidget(text: state.errorMessage)
                        ],
                      )
                    : BuildCompanyProfileSuccess(
                        companyModel: state.companyModel!,
                      ),
          );
        },
      ),
    );
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  verticalSpace(16),
                  RatingAndReviews(companyModel: companyModel),
                  verticalSpace(20),
                  SocialLinks(
                    socialLinks: companyModel.socialMedia,
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
        ),
      ],
    );
  }
}
