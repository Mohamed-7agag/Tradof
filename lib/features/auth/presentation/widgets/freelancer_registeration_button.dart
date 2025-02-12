import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/registeration_cubit/registeration_cubit.dart';
import '../logic/tables_cubit/tables_cubit.dart';

class FreelancerRegisterationButton extends StatelessWidget {
  const FreelancerRegisterationButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterationCubit, RegisterationState>(
      listener: (context, state) {
        if (state.status.isRegistered) {
          context.pushNamedAndRemoveUntil(
            Routes.loginViewRoute,
            predicate: (route) => false,
          );
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
                  _freelancerValidation(state, context);
                },
              );
      },
    );
  }

  void _freelancerValidation(RegisterationState state, BuildContext context) {
    final languagePairs =
        context.read<TablesCubit>().state.selectedLanguagePair;
    final specializations =
        context.read<TablesCubit>().state.selectedSpecializations;
    if (state.countryId == null) {
      errorToast(context, 'Error', 'Please select a country');
    } else if (languagePairs.isNullOrEmpty()) {
      errorToast(context, 'Error', 'Please select at least one language pair');
    } else if (specializations.isNullOrEmpty()) {
      errorToast(context, 'Error', 'Please select at least one specialization');
    } else {
      context
          .read<RegisterationCubit>()
          .registerFreelancer(specializations, languagePairs);
    }
  }
}
