import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';

import '../../../company_profile/data/model/company_model.dart';
import '../logic/company_setting_cubit/company_setting_cubit.dart';

class UpdateCompanyProfileButton extends StatelessWidget {
  const UpdateCompanyProfileButton({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.locationCompanyController,
    required this.companyModel,
    required this.companyNameController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController locationCompanyController;
  final TextEditingController companyNameController;
  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanySettingCubit, CompanySettingState>(
      listenWhen: (previous, current) =>
          current.status.isUpdateCompanyProfileLoading ||
          current.status.isUpdateCompanyProfileFailure ||
          current.status.isUpdateCompanyProfileSuccess,
      buildWhen: (previous, current) =>
          current.status.isUpdateCompanyProfileLoading ||
          current.status.isUpdateCompanyProfileFailure ||
          current.status.isUpdateCompanyProfileSuccess,
      listener: (context, state) {
        if (state.status.isUpdateCompanyProfileSuccess) {
          successToast(context, 'Success', state.message);
          Navigator.pop(context);
        } else if (state.status.isUpdateCompanyProfileFailure) {
          errorToast(context, 'Error', state.errMessage);
        }
      },
      builder: (context, state) {
        return state.status.isUpdateCompanyProfileLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Update',
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  await _updateCompanyProfile(context);
                },
              );
      },
    );
  }

  Future<void> _updateCompanyProfile(BuildContext context) async {
    context.read<CompanySettingCubit>().updateCompanyProfile(
          firstNameController.text.trim(),
          lastNameController.text.trim(),
          emailController.text.trim(),
          companyNameController.text.trim(),
          locationCompanyController.text.trim(),
          phoneNumberController.text.trim(),
          companyModel,
        );
  }
}
