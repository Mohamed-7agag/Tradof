import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/app_constants.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';
import 'package:tradof/features/auth/presentation/logic/freelancer_registeration_cubit.dart';
import 'package:tradof/features/company/profile_company/data/model/company_model.dart';
import 'package:tradof/features/company/profile_company/data/model/company_update_request_model.dart';
import 'package:tradof/features/company/profile_company/presentation/logic/company_profile_cubit/company_profile_cubit.dart';

class EditCompanyProfileButton extends StatelessWidget {
  const EditCompanyProfileButton({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.locationCompanyController,
    required this.companyModel,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController locationCompanyController;
  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyProfileCubit, CompanyProfileState>(
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
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isUpdateCompanyProfileLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Update',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.read<CompanyProfileCubit>().updateCompanyProfile(
                        CompanyUpdateRequestModel(
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
                          companyName: state.companyModel?.companyName ??
                              companyModel.companyName,
                        ),
                      );
                },
              );
      },
    );
  }
}
