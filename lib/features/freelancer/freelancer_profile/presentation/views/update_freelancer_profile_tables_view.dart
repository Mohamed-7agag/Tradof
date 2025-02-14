import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/features/auth/presentation/widgets/language_pair_table.dart';
import 'package:tradof/features/auth/presentation/widgets/specialization_table.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../data/model/freelancer_model.dart';
import '../logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';
import '../widgets/update_freelancer_profile_tables_button.dart';

class UpdateFreelancerProfileTablesView extends StatelessWidget {
  const UpdateFreelancerProfileTablesView({
    super.key,
    required this.freelancerModel,
    required this.isLanguagePair,
  });
  final FreelancerModel freelancerModel;
  final bool isLanguagePair;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title:
            isLanguagePair ? 'Update Languages Pairs' : 'Update Specialization',
        actionIcon: SvgPicture.asset('assets/images/edit.svg', width: 24),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(16),
              isLanguagePair
                  ? SlideInRight(
                      from: 400,
                      child: LanguagePairTable(darkColors: true),
                    )
                  : SlideInRight(
                      from: 400,
                      child: SpecializationTable(darkColors: true),
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
