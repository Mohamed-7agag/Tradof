import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../freelancer_profile/data/model/freelancer_model.dart';
import '../widgets/build_update_freelancer_profile_view.dart';

class UpdateFreelancerProfileView extends StatelessWidget {
  const UpdateFreelancerProfileView({required this.freelancerModel, super.key});
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Personal Info',
        actionIcon: HugeIcons.strokeRoundedPencilEdit02,
      ),
      body: BlocProvider(
        create: (context) => MetaDataCubit(getIt())..getCountries(),
        child:
            BuildUpdateFreelancerProfileView(freelancerModel: freelancerModel),
      ),
    );
  }
}
