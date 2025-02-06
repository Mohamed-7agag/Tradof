import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/utils/app_constants.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';
import 'package:tradof/core/utils/widgets/upload_image_to_cloudinary.dart';

import '../../../../auth/presentation/logic/freelancer_registeration_cubit.dart';
import '../../../company_profile/data/model/company_model.dart';
import '../../../company_profile/data/model/company_update_request_model.dart';
import '../logic/cubit/company_setting_cubit.dart';

class UpdateCompanyProfileButton extends StatefulWidget {
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
  State<UpdateCompanyProfileButton> createState() =>
      _UpdateCompanyProfileButtonState();
}

class _UpdateCompanyProfileButtonState
    extends State<UpdateCompanyProfileButton> {
  String? image = '';

  Future<void> imageProfile() async {
    image = widget.companyModel.profileImageUrl;
    if (context.read<ProfileImageAndCountryCubit>().state.imagePicked != null) {
      image = await uploadImageToCloudinary(
          context.read<ProfileImageAndCountryCubit>().state.imagePicked);
    }
  }

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
                  await imageProfile();
                  if (context.mounted) {
                    context.read<CompanySettingCubit>().updateCompanyProfile(
                          UpdateCompanyRequestModel(
                            id: AppConstants.kUserId,
                            firstName: widget.firstNameController.text,
                            lastName: widget.lastNameController.text,
                            email: widget.emailController.text,
                            phoneNumber: widget.phoneNumberController.text,
                            companyAddress:
                                widget.locationCompanyController.text,
                            countryId: context
                                    .read<ProfileImageAndCountryCubit>()
                                    .state
                                    .countryId ??
                                widget.companyModel.countryId,
                            companyName: widget.companyNameController.text,
                            profileImageUrl: image!,
                          ),
                        );
                  }
                },
              );
      },
    );
  }
}
