import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/widgets/custom_text_field.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import 'package:tradof/features/auth/presentation/widgets/country_drop_down_section.dart';
import 'package:tradof/features/auth/presentation/widgets/industries_served_table.dart';
import 'package:tradof/features/auth/presentation/widgets/prefered_languages_table.dart';

import '../../../../core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import '../../../../core/utils/widgets/custom_loading_dialog.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../widgets/company_registeration_button.dart';
import '../widgets/create_account_curve_with_image.dart';

class CompanyRegisterView extends StatefulWidget {
  const CompanyRegisterView({super.key});

  @override
  State<CompanyRegisterView> createState() => _CompanyRegisterViewState();
}

class _CompanyRegisterViewState extends State<CompanyRegisterView> {
  late final TextEditingController jobTitleController;
  late final TextEditingController locationCompanyController;
  late final TextEditingController companyNameController;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => loadingDialog(context));
    jobTitleController = TextEditingController();
    locationCompanyController = TextEditingController();
    companyNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    jobTitleController.dispose();
    locationCompanyController.dispose();
    companyNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TablesCubit(),
      child: BlocListener<MetaDataCubit, MetaDataState>(
        listener: (context, state) {
          if (state.status.isError) {
            context.pop();
            context.pop();
            errorToast(context, 'Error', state.errorMessage);
          } else if (state.languages.isNotEmpty &&
              state.countries.isNotEmpty &&
              state.specializations.isNotEmpty) {
            context.pop();
          }
        },
        child: Column(
          children: [
            CreateAccountCurveWithImage(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SlideInRight(
                    from: 400,
                    child: CustomTextField(
                      labelText: 'Job Title',
                      labelColor: AppColors.white,
                      controller: jobTitleController,
                      keyboardType: TextInputType.text,
                      outlineBorder: true,
                    ),
                  ),
                  verticalSpace(12),
                  SlideInRight(
                    from: 400,
                    delay: Duration(milliseconds: 125),
                    child: CustomTextField(
                      labelText: 'Company Name',
                      labelColor: AppColors.white,
                      controller: companyNameController,
                      keyboardType: TextInputType.text,
                      outlineBorder: true,
                    ),
                  ),
                  verticalSpace(12),
                  CountryDropDownSection(),
                  verticalSpace(12),
                  SlideInRight(
                    from: 400,
                    delay: Duration(milliseconds: 375),
                    child: CustomTextField(
                      labelText: 'Location Company',
                      labelColor: AppColors.white,
                      controller: locationCompanyController,
                      keyboardType: TextInputType.text,
                      outlineBorder: true,
                    ),
                  ),
                  verticalSpace(28),
                  SlideInLeft(
                    from: 400,
                    delay: Duration(milliseconds: 500),
                    child: PreferedLanguagesTable(),
                  ),
                  verticalSpace(28),
                  SlideInLeft(
                    from: 400,
                    delay: Duration(milliseconds: 625),
                    child: IndustriesServedTable(),
                  ),
                  verticalSpace(40),
                  SlideInUp(
                    from: 400,
                    delay: Duration(milliseconds: 750),
                    child: CompanyRegisterationButton(
                      jobTitleController: jobTitleController,
                      locationCompanyController: locationCompanyController,
                      companyNameController: companyNameController,
                    ),
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
