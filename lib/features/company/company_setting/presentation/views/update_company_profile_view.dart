import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../company_profile/data/model/company_model.dart';
import '../widgets/build_update_company_profile_view.dart';

class UpdateCompanyProfileView extends StatelessWidget {
  const UpdateCompanyProfileView({required this.companyModel, super.key});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Personal Info',
        actionIcon: HugeIcons.strokeRoundedPencilEdit02,
      ),
      body: BlocProvider(
        create: (context) => MetaDataCubit(getIt())..getCountries(),
        child: BuildUpdateCompanyProfileView(companyModel: companyModel),
      ),
    );
  }
}
