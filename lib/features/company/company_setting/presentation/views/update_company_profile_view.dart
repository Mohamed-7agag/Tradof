import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';

import '../../../company_profile/presentation/logic/company_profile_cubit/company_profile_cubit.dart';
import '../widgets/build_update_company_profile_view.dart';

class UpdateCompanyProfileView extends StatefulWidget {
  const UpdateCompanyProfileView({super.key});

  @override
  State<UpdateCompanyProfileView> createState() =>
      _UpdateCompanyProfileViewState();
}

class _UpdateCompanyProfileViewState extends State<UpdateCompanyProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocProvider(
        create: (context) => MetaDataCubit(getIt())..getCountries(),
        child: BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
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
            return BuildUpdateCompanyProfileView(
              companyModel: state.companyModel!,
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      leadingWidth: 40,
      title: Text(
        'Personal Info',
        style: AppStyle.robotoBold20,
      ),
      actions: [
        SvgPicture.asset('assets/images/edit.svg', width: 24),
        horizontalSpace(16),
      ],
      toolbarHeight: 65,
    );
  }
}
