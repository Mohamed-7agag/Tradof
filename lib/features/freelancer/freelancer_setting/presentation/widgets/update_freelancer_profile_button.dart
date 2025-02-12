import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';

import '../../../freelancer_profile/data/model/freelancer_model.dart';
import '../logic/freelancer_setting_cubit/freelancer_setting_cubit.dart';

class UpdateFreelancerProfileButton extends StatelessWidget {
  const UpdateFreelancerProfileButton({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.freelancerModel,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final FreelancerModel freelancerModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FreelancerSettingCubit, FreelancerSettingState>(
      listenWhen: (previous, current) =>
          current.status.isUpdateFreelancerProfileLoading ||
          current.status.isUpdateFreelancerProfileFailure ||
          current.status.isUpdateFreelancerProfileSuccess,
      buildWhen: (previous, current) =>
          current.status.isUpdateFreelancerProfileLoading ||
          current.status.isUpdateFreelancerProfileFailure ||
          current.status.isUpdateFreelancerProfileSuccess,
      listener: (context, state) {
        if (state.status.isUpdateFreelancerProfileSuccess) {
          successToast(context, 'Success', state.message);
          context.pop(result: true);
        } else if (state.status.isUpdateFreelancerProfileFailure) {
          errorToast(context, 'Error', state.errMessage);
        }
      },
      builder: (context, state) {
        return state.status.isUpdateFreelancerProfileLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Update',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _updateFreelancerProfile(context);
                },
              );
      },
    );
  }

  void _updateFreelancerProfile(BuildContext context) {
    context.read<FreelancerSettingCubit>().updateFreelancerProfile(
          firstNameController.text.trim(),
          lastNameController.text.trim(),
          emailController.text.trim(),
          phoneNumberController.text.trim(),
          freelancerModel,
        );
  }
}
