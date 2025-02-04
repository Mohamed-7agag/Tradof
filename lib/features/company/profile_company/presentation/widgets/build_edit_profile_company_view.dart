import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/utils/app_constants.dart';
import 'package:tradof/core/utils/widgets/custom_button.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/core/utils/widgets/custom_text_field.dart';
import 'package:tradof/features/auth/presentation/logic/freelancer_registeration_cubit.dart';
import 'package:tradof/features/auth/presentation/widgets/phone_number_text_field.dart';
import 'package:tradof/features/company/profile_company/data/model/company_model.dart';
import 'package:tradof/features/company/profile_company/data/model/company_update_request_model.dart';
import 'package:tradof/features/company/profile_company/presentation/logic/company_profile_cubit/company_profile_cubit.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/country_drop_down_edit.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/profile_image_edit.dart';

class BuildEditProfileCompanyView extends StatefulWidget {
  const BuildEditProfileCompanyView({super.key, required this.companyModel});
  final CompanyModel companyModel;

  @override
  State<BuildEditProfileCompanyView> createState() =>
      _BuildEditProfileCompanyViewState();
}

class _BuildEditProfileCompanyViewState
    extends State<BuildEditProfileCompanyView> {
  late final GlobalKey<FormState> formKey;

  late final TextEditingController emailController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController locationCompanyController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController(text: widget.companyModel.email);
    firstNameController =
        TextEditingController(text: widget.companyModel.firstName);
    lastNameController =
        TextEditingController(text: widget.companyModel.lastName);

    phoneNumberController = TextEditingController(
        text: widget.companyModel.phone.length==1
            ? widget.companyModel.phone.substring(1)
            : widget.companyModel.phone);
    locationCompanyController =
        TextEditingController(text: widget.companyModel.companyAddress);
    context
        .read<ProfileImageAndCountryCubit>()
        .onCountrySelected(widget.companyModel.countryId);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<ProfileImageAndCountryCubit>()
          .onCountrySelected(widget.companyModel.countryId);
    });

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    locationCompanyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        verticalSpace(35),
        ProfileImageEdit(),
        verticalSpace(40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              CustomTextField(
                labelText: 'First Name',
                labelColor: AppColors.darkGrey,
                controller: firstNameController,
                keyboardType: TextInputType.text,
                labelBehavior: true,
                outlineBorder: false,
              ),
              verticalSpace(20),
              CustomTextField(
                labelText: 'Last Name',
                labelColor: AppColors.darkGrey,
                controller: lastNameController,
                keyboardType: TextInputType.text,
                labelBehavior: true,
                outlineBorder: false,
              ),
              verticalSpace(20),
              CustomTextField(
                labelText: 'Email',
                labelColor: AppColors.darkGrey,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                labelBehavior: true,
                outlineBorder: false,
              ),
              verticalSpace(20),
              PhoneNumberTextField(
                labelText: 'Phone Number',
                controller: phoneNumberController,
                borderColor: AppColors.darkGrey,
                labelBehavior: true,
              ),
              verticalSpace(20),
              CountryDropDownEdit(
                initialCountryId: widget.companyModel.countryId,
              ),
              verticalSpace(20),
              CustomTextField(
                labelText: 'Location',
                labelColor: AppColors.darkGrey,
                controller: locationCompanyController,
                labelBehavior: true,
                outlineBorder: false,
              ),
              verticalSpace(40),
              BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
                builder: (context, state) {
                  if (state.status.isError) {
                    return CustomFailureWidget(text: state.errorMessage);
                  } else if (state.status.isLoading) {
                    return CustomLoadingWidget();
                  } else {
                    return CustomButton(
                      text: 'Save',
                      onPressed: () {
                        context
                            .read<CompanyProfileCubit>()
                            .updateCompanyProfile(
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
                                    10,
                                companyName:
                                    state.companyModel?.companyName ?? '',
                              ),
                            );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
