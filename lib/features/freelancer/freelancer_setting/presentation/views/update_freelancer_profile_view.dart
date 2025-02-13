import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';

import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../freelancer_profile/data/model/freelancer_model.dart';
import '../widgets/build_update_freelancer_profile_view.dart';

class UpdateFreelancerProfileView extends StatelessWidget {
  const UpdateFreelancerProfileView({super.key, required this.freelancerModel});
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Personal Info',
        actionIcon: SvgPicture.asset('assets/images/edit.svg', width: 24),
      ),
      body: BlocProvider(
        create: (context) => MetaDataCubit(getIt())..getCountries(),
        child:
            BuildUpdateFreelancerProfileView(freelancerModel: freelancerModel),
      ),
    );
  }
}
