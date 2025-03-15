import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../../profile/freelancer_profile/data/model/freelancer_model.dart';
import '../logic/freelancer_setting_cubit/freelancer_setting_cubit.dart';

class UpdateFreelancerProfileButton extends StatelessWidget {
  const UpdateFreelancerProfileButton({
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneNumberController,
    required this.freelancerModel,
    super.key,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneNumberController;
  final FreelancerModel freelancerModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FreelancerSettingCubit, FreelancerSettingState>(
      listenWhen: (previous, current) => _listenAndBuildWhen(current),
      buildWhen: (previous, current) => _listenAndBuildWhen(current),
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

  bool _listenAndBuildWhen(FreelancerSettingState current) {
    return current.status.isUpdateFreelancerProfileLoading ||
        current.status.isUpdateFreelancerProfileFailure ||
        current.status.isUpdateFreelancerProfileSuccess;
  }

  void _updateFreelancerProfile(BuildContext context) {
    context.read<FreelancerSettingCubit>().updateFreelancerProfile(
          firstNameController.text.trim(),
          lastNameController.text.trim(),
          phoneNumberController.text.trim(),
          freelancerModel,
        );
  }
}
