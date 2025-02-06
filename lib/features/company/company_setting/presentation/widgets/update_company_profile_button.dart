import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/app_constants.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';

import '../../../../auth/presentation/logic/freelancer_registeration_cubit.dart';
import '../../../company_profile/data/model/company_model.dart';
import '../../../company_profile/data/model/company_update_request_model.dart';
import '../logic/cubit/company_setting_cubit.dart';

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
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.read<CompanySettingCubit>().updateCompanyProfile(
                        UpdateCompanyRequestModel(
                          id: AppConstants.kUserId,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          phoneNumber: phoneNumberController.text,
                          companyAddress: locationCompanyController.text,
                          countryId: context
                                  .read<ProfileImageAndCountryCubit>()
                                  .state
                                  .countryId ??
                              companyModel.countryId,
                          companyName: companyNameController.text,
                        ),
                      );
                },
              );
      },
    );
  }
}
