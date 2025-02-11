import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/widgets/custom_text_field.dart';

import '../../../../auth/presentation/widgets/phone_number_text_field.dart';
import '../../../company_profile/data/model/company_model.dart';
import '../logic/company_setting_cubit/company_setting_cubit.dart';
import 'country_drop_down_edit.dart';
import 'update_company_profile_button.dart';
import 'update_company_profile_image.dart';

class BuildUpdateCompanyProfileView extends StatefulWidget {
  const BuildUpdateCompanyProfileView({
    super.key,
    required this.companyModel,
  });
  final CompanyModel companyModel;

  @override
  State<BuildUpdateCompanyProfileView> createState() =>
      _BuildUpdateCompanyProfileViewState();
}

class _BuildUpdateCompanyProfileViewState
    extends State<BuildUpdateCompanyProfileView> {
  late final GlobalKey<FormState> formKey;

  late final TextEditingController emailController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController locationCompanyController;
  late final TextEditingController companyNameController;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController(text: widget.companyModel.email);
    firstNameController =
        TextEditingController(text: widget.companyModel.firstName);
    lastNameController =
        TextEditingController(text: widget.companyModel.lastName);
    phoneNumberController =
        TextEditingController(text: widget.companyModel.phone);
    locationCompanyController =
        TextEditingController(text: widget.companyModel.companyAddress);
    companyNameController =
        TextEditingController(text: widget.companyModel.companyName);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    locationCompanyController.dispose();
    companyNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(30),
            UpdateCompanyProfileImage(
              imageUrl: widget.companyModel.profileImageUrl,
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
                    labelBehavior: false,
                    outlineBorder: true,
                  ),
                  verticalSpace(20),
                  CustomTextField(
                    labelText: 'Last Name',
                    labelColor: AppColors.darkGrey,
                    controller: lastNameController,
                    keyboardType: TextInputType.text,
                    labelBehavior: false,
                    outlineBorder: true,
                  ),
                  verticalSpace(20),
                  CustomTextField(
                    labelText: 'Company Name',
                    labelColor: AppColors.darkGrey,
                    controller: companyNameController,
                    keyboardType: TextInputType.text,
                    labelBehavior: false,
                    outlineBorder: true,
                  ),
                  verticalSpace(20),
                  CustomTextField(
                    labelText: 'Email',
                    labelColor: AppColors.darkGrey,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    labelBehavior: false,
                    outlineBorder: true,
                  ),
                  verticalSpace(20),
                  CustomTextField(
                    labelText: 'Location',
                    labelColor: AppColors.darkGrey,
                    controller: locationCompanyController,
                    labelBehavior: false,
                    outlineBorder: true,
                  ),
                  verticalSpace(20),
                  PhoneNumberTextField(
                    labelText: 'Phone Number',
                    controller: phoneNumberController,
                    borderColor: AppColors.darkGrey,
                    labelBehavior: false,
                    outlineBorder: true,
                  ),
                  verticalSpace(18),
                  CountryDropDownEdit(
                    initialCountryId: widget.companyModel.countryId,
                    onChanged: (value) {
                      context
                          .read<CompanySettingCubit>()
                          .setImageProfileAndCountryId(
                            countryId:
                                value?.id ?? widget.companyModel.countryId,
                          );
                    },
                  ),
                  verticalSpace(60),
                  UpdateCompanyProfileButton(
                    companyNameController: companyNameController,
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    emailController: emailController,
                    phoneNumberController: phoneNumberController,
                    locationCompanyController: locationCompanyController,
                    companyModel: widget.companyModel,
                  ),
                  verticalSpace(40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
