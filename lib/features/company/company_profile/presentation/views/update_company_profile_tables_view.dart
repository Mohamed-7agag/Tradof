import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/features/auth/presentation/widgets/industries_served_table.dart';
import 'package:tradof/features/auth/presentation/widgets/prefered_languages_table.dart';
import 'package:tradof/features/company/company_profile/data/model/company_model.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../logic/company_profile_cubit/company_profile_cubit.dart';
import '../widgets/update_company_profile_tables_button.dart';

class UpdateCompanyProfileTablesView extends StatelessWidget {
  const UpdateCompanyProfileTablesView({
    super.key,
    required this.companyModel,
    required this.isPreferedLanguages,
  });
  final CompanyModel companyModel;
  final bool isPreferedLanguages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: isPreferedLanguages ? 'Update Prefered Languages' : 'Update Industries',
        actionIcon: SvgPicture.asset('assets/images/edit.svg', width: 24),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(16),
              isPreferedLanguages
                  ? SlideInRight(
                      from: 400,
                      child: PreferedLanguagesTable(darkColors: true),
                    )
                  : SlideInRight(
                      from: 400,
                      child: IndustriesServedTable(darkColors: true),
                    ),
              verticalSpace(50),
              BlocProvider(
                create: (context) => CompanyProfileCubit(getIt()),
                child: SlideInLeft(
                  from: 400,
                  child: UpdateCompanyProfileTablesButton(
                    companyModel: companyModel,
                    isPreferedLanguages:isPreferedLanguages,
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
