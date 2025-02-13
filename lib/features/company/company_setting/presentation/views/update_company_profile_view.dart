import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import 'package:tradof/features/company/company_profile/data/model/company_model.dart';

import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../widgets/build_update_company_profile_view.dart';

class UpdateCompanyProfileView extends StatelessWidget {
  const UpdateCompanyProfileView({super.key, required this.companyModel});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Personal Info',
        actionIcon: SvgPicture.asset('assets/images/edit.svg', width: 24),
      ),
      body: BlocProvider(
        create: (context) => MetaDataCubit(getIt())..getCountries(),
        child: BuildUpdateCompanyProfileView(companyModel: companyModel),
      ),
    );
  }
}
