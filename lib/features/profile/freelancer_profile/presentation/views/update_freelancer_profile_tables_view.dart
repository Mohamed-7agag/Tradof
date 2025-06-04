import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../auth/presentation/widgets/language_pair_table.dart';
import '../../../../auth/presentation/widgets/specialization_table.dart';
import '../../data/model/freelancer_model.dart';
import '../logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';
import '../widgets/update_freelancer_profile_tables_button.dart';

class UpdateFreelancerProfileTablesView extends StatelessWidget {
  const UpdateFreelancerProfileTablesView({
    required this.freelancerModel,
    required this.isLanguagePair,
    super.key,
  });
  final FreelancerModel freelancerModel;
  final bool isLanguagePair;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title:
            isLanguagePair ? 'Update Languages Pairs' : 'Update Specialization',
        actionIcon: HugeIcons.strokeRoundedPencilEdit02,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              verticalSpace(16),
              isLanguagePair
                  ? SlideInRight(
                      from: 400,
                      child: const LanguagePairTable(darkColors: true),
                    )
                  : SlideInRight(
                      from: 400,
                      child: const SpecializationTable(darkColors: true),
                    ),
              verticalSpace(50),
              BlocProvider(
                create: (context) => FreelancerProfileCubit(getIt()),
                child: SlideInLeft(
                  from: 400,
                  child: UpdateFreelancerProfileTablesButton(
                    freelancerModel: freelancerModel,
                    islanguagePair: isLanguagePair,
                  ),
                ),
              ),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }
}
