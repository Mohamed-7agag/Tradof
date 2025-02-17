import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../auth/presentation/widgets/phone_number_text_field.dart';
import '../../../../company/company_setting/presentation/widgets/country_drop_down_edit.dart';
import '../../../freelancer_profile/data/model/freelancer_model.dart';
import '../logic/freelancer_setting_cubit/freelancer_setting_cubit.dart';
import 'update_freelancer_profile_button.dart';
import 'update_freelancer_profile_image.dart';

class BuildUpdateFreelancerProfileView extends StatefulWidget {
  const BuildUpdateFreelancerProfileView({
    required this.freelancerModel,
    super.key,
  });
  final FreelancerModel freelancerModel;

  @override
  State<BuildUpdateFreelancerProfileView> createState() =>
      _BuildUpdateFreelancerProfileViewState();
}

class _BuildUpdateFreelancerProfileViewState
    extends State<BuildUpdateFreelancerProfileView> {
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneNumberController;

  @override
  void initState() {
    super.initState();
    firstNameController =
        TextEditingController(text: widget.freelancerModel.firstName);
    lastNameController =
        TextEditingController(text: widget.freelancerModel.lastName);
    phoneNumberController =
        TextEditingController(text: widget.freelancerModel.phone);
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(30),
          UpdateFreelancerProfileImage(
            imageUrl: widget.freelancerModel.profileImageUrl,
          ),
          verticalSpace(50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                CustomTextField(
                  labelText: 'First Name',
                  labelColor: AppColors.darkGrey,
                  controller: firstNameController,
                  keyboardType: TextInputType.text,
                  outlineBorder: true,
                ),
                verticalSpace(20),
                CustomTextField(
                  labelText: 'Last Name',
                  labelColor: AppColors.darkGrey,
                  controller: lastNameController,
                  keyboardType: TextInputType.text,
                  outlineBorder: true,
                ),
                verticalSpace(20),
                PhoneNumberTextField(
                  labelText: 'Phone Number',
                  controller: phoneNumberController,
                  borderColor: AppColors.darkGrey,
                  outlineBorder: true,
                ),
                verticalSpace(18),
                CountryDropDownEdit(
                  initialCountryId: widget.freelancerModel.countryId,
                  countryName: widget.freelancerModel.countryName,
                  onChanged: (value) {
                    context
                        .read<FreelancerSettingCubit>()
                        .setImageProfileAndCountryId(
                          countryId:
                              value?.id ?? widget.freelancerModel.countryId,
                        );
                  },
                ),
                verticalSpace(60),
                UpdateFreelancerProfileButton(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  phoneNumberController: phoneNumberController,
                  freelancerModel: widget.freelancerModel,
                ),
                verticalSpace(40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
