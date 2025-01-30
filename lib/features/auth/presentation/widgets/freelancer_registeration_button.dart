import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/registeration_cubit/registeration_cubit.dart';

class FreelancerRegisterationButton extends StatelessWidget {
  const FreelancerRegisterationButton(
      {super.key, required this.countryId, this.imageFile});
  final int? countryId;
  final XFile? imageFile;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterationCubit, RegisterationState>(
      listener: (context, state) {
        if (state.status.isRegistered) {
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
                  if (countryId == null) {
                    errorToast(context, 'Error', 'Please select a country');
                  } else if (context
                      .read<TablesCubit>()
                      .state
                      .selectedLanguagePair
                      .isNullOrEmpty()) {
                    errorToast(context, 'Error',
                        'Please select at least one language pair');
                  } else if (context
                      .read<TablesCubit>()
                      .state
                      .selectedSpecializations
                      .isNullOrEmpty()) {
                    errorToast(context, 'Error',
                        'Please select at least one specialization');
                  } else {
                    context.read<RegisterationCubit>().freelancerData(
                          imageFile ?? XFile(''),
                          countryId!,
                          context
                              .read<TablesCubit>()
                              .state
                              .selectedSpecializations,
                          context
                              .read<TablesCubit>()
                              .state
                              .selectedLanguagePair,
                        );
                  }
                },
              );
      },
    );
  }
}
