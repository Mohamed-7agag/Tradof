import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import 'package:tradof/core/utils/widgets/custom_app_bar.dart';
import 'package:tradof/core/utils/widgets/custom_drop_down_widget.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/features/auth/presentation/widgets/country_drop_down.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../auth/presentation/widgets/phone_number_text_field.dart';
import '../logic/company_profile_cubit/company_profile_cubit.dart';
import '../widgets/add_employee_button.dart';

class CompanyAddEmployeeView extends StatefulWidget {
  const CompanyAddEmployeeView({super.key});

  @override
  State<CompanyAddEmployeeView> createState() => _CompanyAddEmployeeViewState();
}

class _CompanyAddEmployeeViewState extends State<CompanyAddEmployeeView> {
  late final GlobalKey<FormState> formKey;

  late final TextEditingController emailController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController passwordController;
  late final TextEditingController jobTitleController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    jobTitleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    jobTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: 'Add Employee'),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(20),
                SlideInRight(
                  from: 400,
                  child: CustomTextField(
                    labelText: 'First Name',
                    controller: firstNameController,
                    keyboardType: TextInputType.text,
                    labelColor: AppColors.darkGrey,
                    outlineBorder: true,
                  ),
                ),
                verticalSpace(14),
                SlideInRight(
                  from: 400,
                  delay: const Duration(milliseconds: 75),
                  child: CustomTextField(
                    labelText: 'Last Name',
                    controller: lastNameController,
                    keyboardType: TextInputType.text,
                    labelColor: AppColors.darkGrey,
                    outlineBorder: true,
                  ),
                ),
                verticalSpace(14),
                SlideInRight(
                  from: 400,
                  delay: const Duration(milliseconds: 150),
                  child: CustomTextField(
                    labelText: 'Email',
                    controller: emailController,
                    labelColor: AppColors.darkGrey,
                    keyboardType: TextInputType.emailAddress,
                    outlineBorder: true,
                  ),
                ),
                verticalSpace(14),
                SlideInRight(
                  from: 400,
                  delay: const Duration(milliseconds: 225),
                  child: CustomTextField(
                    labelText: 'Password',
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    labelColor: AppColors.darkGrey,
                    outlineBorder: true,
                  ),
                ),
                verticalSpace(14),
                SlideInRight(
                  from: 400,
                  delay: const Duration(milliseconds: 300),
                  child: CustomTextField(
                    labelText: 'Job Title',
                    controller: jobTitleController,
                    keyboardType: TextInputType.text,
                    labelColor: AppColors.darkGrey,
                    outlineBorder: true,
                  ),
                ),
                verticalSpace(14),
                SlideInRight(
                  from: 400,
                  delay: const Duration(milliseconds: 375),
                  child: PhoneNumberTextField(
                    labelText: 'Phone Number',
                    borderColor: AppColors.darkGrey,
                    controller: phoneNumberController,
                    outlineBorder: true,
                  ),
                ),
                verticalSpace(14),
                SlideInRight(
                  from: 400,
                  delay: const Duration(milliseconds: 450),
                  child: CustomDropDownWidget(
                    hint: 'Group Name',
                    items: employeesGroups,
                    focusedBorderColor: AppColors.grey,
                    textColor: AppColors.darkGrey,
                    dropdownColor: AppColors.white,
                    iconColor: AppColors.darkGrey,
                    onChanged: (group) {
                      context
                          .read<CompanyProfileCubit>()
                          .setGroupNameAndCountryId(groupName: group);
                    },
                  ),
                ),
                verticalSpace(14),
                SlideInRight(
                  from: 400,
                  delay: const Duration(milliseconds: 525),
                  child: BlocBuilder<MetaDataCubit, MetaDataState>(
                    builder: (context, state) {
                      if (state.status.isGetCountries) {
                        return CountryDropDown(
                          hint: 'Country',
                          items: state.countries,
                          borderColor: AppColors.grey,
                          textColor: AppColors.darkGrey,
                          dropdownColor: AppColors.white,
                          iconColor: AppColors.darkGrey,
                          onChanged: (country) {
                            context
                                .read<CompanyProfileCubit>()
                                .setGroupNameAndCountryId(
                                  countryId: country?.id,
                                );
                          },
                        );
                      } else if (state.status.isError) {
                        return CustomFailureWidget(text: state.errorMessage);
                      }
                      return const CustomLoadingWidget();
                    },
                  ),
                ),
                verticalSpace(50),
                SlideInUp(
                  from: 400,
                  delay: const Duration(milliseconds: 600),
                  child: AddEmployeeButton(
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    jobTitleController: jobTitleController,
                    phoneNumberController: phoneNumberController,
                    formKey: formKey,
                  ),
                ),
                verticalSpace(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
