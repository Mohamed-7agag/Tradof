import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import 'package:tradof/features/company/company_profile/data/model/company_model.dart';

import '../widgets/build_update_company_profile_view.dart';

class UpdateCompanyProfileView extends StatelessWidget {
  const UpdateCompanyProfileView({super.key, required this.companyModel});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocProvider(
        create: (context) => MetaDataCubit(getIt())..getCountries(),
        child: BuildUpdateCompanyProfileView(companyModel: companyModel),
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
