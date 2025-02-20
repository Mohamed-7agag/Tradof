import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/registeration_cubit/registeration_cubit.dart';
import '../logic/tables_cubit/tables_cubit.dart';

class CompanyRegisterationButton extends StatelessWidget {
  const CompanyRegisterationButton({
    required this.jobTitleController,
    required this.locationCompanyController,
    required this.companyNameController,
    super.key,
  });
  final TextEditingController jobTitleController;
  final TextEditingController locationCompanyController;
  final TextEditingController companyNameController;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterationCubit, RegisterationState>(
      listener: (context, state) {
        if (state.status.isRegisterationSuccess) {
          context.pushNamedAndRemoveUntil(
            Routes.loginViewRoute,
            predicate: (route) => false,
          );
          successToast(context, 'Success', state.successMessage);
        } else if (state.status.isRegisterationFailure) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isRegisterationLoading
            ? const CustomLoadingWidget(color: AppColors.white)
            : CustomButton(
                text: 'Submit',
                color: AppColors.lightOrange,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _validateCompanyRegisterData(state, context);
                },
              );
      },
    );
  }

  void _validateCompanyRegisterData(
      RegisterationState state, BuildContext context) {
    final preferedLanguages =
        context.read<TablesCubit>().state.selectedPreferedLanguages;
    final industriesServed =
        context.read<TablesCubit>().state.selectedIndustriesServed;

    if (jobTitleController.text.trim().isNullOrEmpty()) {
      errorToast(context, 'Error', 'Please enter job title');
    } else if (companyNameController.text.trim().isNullOrEmpty()) {
      errorToast(context, 'Error', 'Please enter company name');
    } else if (state.countryId == null) {
      errorToast(context, 'Error', 'Please select a country');
    } else if (locationCompanyController.text.trim().isNullOrEmpty()) {
      errorToast(context, 'Error', 'Please enter location of company');
    } else if (preferedLanguages.isNullOrEmpty()) {
      errorToast(
          context, 'Error', 'Please select at least one prefered language');
    } else if (industriesServed.isNullOrEmpty()) {
      errorToast(
          context, 'Error', 'Please select at least one industry served');
    } else {
      context.read<RegisterationCubit>().registerCompany(
            jobTitleController.text.trim(),
            companyNameController.text.trim(),
            locationCompanyController.text.trim(),
            preferedLanguages,
            industriesServed,
          );
    }
  }
}
