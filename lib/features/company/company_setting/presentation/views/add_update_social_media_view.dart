import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/add_update_social_media_appbar.dart';
import 'package:tradof/features/company/company_setting/presentation/widgets/build_add_update_social_media.dart';
import 'package:tradof/features/company/profile_company/presentation/logic/company_profile_cubit/company_profile_cubit.dart';

class AddUpdateSocialMediaView extends StatelessWidget {
  const AddUpdateSocialMediaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AddUpdateSocialMediaAppbar(),
          BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
            buildWhen: (previous, current) =>
                current.status.isGetCompanySuccess ||
                current.status.isGetCompanyFailure ||
                current.status.isGetCompanyloading,
            builder: (context, state) {
              if (state.status.isGetCompanyloading) {
                return const CustomLoadingWidget();
              } else if (state.status.isGetCompanyFailure) {
                return CustomFailureWidget(text: state.errorMessage);
              }
              return BuildAddUpdateSocialMedia(
                socialMediaModel: state.companyModel!.socialMedia,
              );
            },
          ),
        ],
      ),
    );
  }
}

