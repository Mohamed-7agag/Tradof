import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/registeration_cubit/registeration_cubit.dart';

class CompanyRegisterationButton extends StatelessWidget {
  const CompanyRegisterationButton({
    super.key,
    required this.countryId,
    this.imageUrl,
    required this.jobTitleController,
    required this.locationCompanyController,
  });
  final int? countryId;
  final File? imageUrl;
  final TextEditingController jobTitleController;
  final TextEditingController locationCompanyController;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterationCubit, RegisterationState>(
      listener: (context, state) {
        if (state.status.isRegistered) {
          context.go(Routes.loginViewRoute);
          successToast(context, 'Success', state.registerSuccessMessage);
        } else if (state.status.isError) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isLoading
            ? const CustomLoadingWidget(color: AppColors.white)
            : CustomButton(
                text: 'Submit',
                color: AppColors.lightOrange,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (jobTitleController.text.isNullOrEmpty()) {
                    errorToast(context, 'Error', 'Please enter job title');
                  } else if (countryId == null) {
                    errorToast(context, 'Error', 'Please select a country');
                  } else if (locationCompanyController.text.isNullOrEmpty()) {
                    errorToast(
                        context, 'Error', 'Please enter location of company');
                  } else if (context
                      .read<TablesCubit>()
                      .state
                      .selectedPreferedLanguages
                      .isNullOrEmpty()) {
                    errorToast(context, 'Error',
                        'Please select at least one prefered language');
                  } else if (context
                      .read<TablesCubit>()
                      .state
                      .selectedIndustriesServed
                      .isNullOrEmpty()) {
                    errorToast(context, 'Error',
                        'Please select at least one industry served');
                  } else {
                    context.read<RegisterationCubit>().companyData(
                          imageUrl ?? File(''),
                          jobTitleController.text.trim(),
                          countryId!,
                          locationCompanyController.text.trim(),
                          context
                              .read<TablesCubit>()
                              .state
                              .selectedPreferedLanguages,
                          context
                              .read<TablesCubit>()
                              .state
                              .selectedIndustriesServed,
                        );
                  }
                },
              );
      },
    );
  }
}
