import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/utils/logic/meta_data_cubit/meta_data_cubit.dart';
import 'package:tradof/core/utils/widgets/custom_drop_down_widget.dart';
import 'package:tradof/core/utils/widgets/custom_failure_widget.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/features/auth/presentation/widgets/country_drop_down.dart';
import 'package:tradof/features/company/company_profile/presentation/widgets/add_employee_button.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../auth/presentation/logic/freelancer_registeration_cubit.dart';
import '../../../../auth/presentation/widgets/phone_number_text_field.dart';

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

  String? groupName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
                  delay: Duration(milliseconds: 90),
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
                  delay: Duration(milliseconds: 180),
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
                  delay: Duration(milliseconds: 270),
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
                  delay: Duration(milliseconds: 360),
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
                  delay: Duration(milliseconds: 450),
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
                  delay: Duration(milliseconds: 540),
                  child: CustomDropDownDarBorderkWidget(
                    hint: 'Group Name',
                    items: employeesGroups,
                    onChanged: (group) {
                      setState(() {
                        groupName = group; // will be refactor
                      });
                    },
                  ),
                ),
                verticalSpace(14),
                SlideInRight(
                  from: 400,
                  delay: Duration(milliseconds: 630),
                  child: BlocBuilder<ProfileImageAndCountryCubit,
                      ProfileImageAndCountryState>(
                    buildWhen: (previous, current) =>
                        previous.countryId != current.countryId,
                    builder: (context, state) {
                      return BlocBuilder<MetaDataCubit, MetaDataState>(
                        builder: (context, metaDataState) {
                          if (metaDataState.status.isGetCountries) {
                            return CountryDarkBorderDropDown(
                              hint: 'Country',
                              items: metaDataState.countries,
                              onChanged: (country) {
                                context
                                    .read<ProfileImageAndCountryCubit>()
                                    .onCountrySelected(country?.id);
                              },
                            );
                          } else if (metaDataState.status.isError) {
                            return CustomFailureWidget(
                                text: metaDataState.errorMessage);
                          }
                          return CustomLoadingWidget();
                        },
                      );
                    },
                  ),
                ),
                verticalSpace(50),
                SlideInUp(
                  from: 400,
                  delay: Duration(milliseconds: 720),
                  child: AddEmployeeButton(
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    jobTitleController: jobTitleController,
                    phoneNumberController: phoneNumberController,
                    formKey: formKey,
                    groupName: groupName ?? '',
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

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      leadingWidth: 40,
      title: Text(
        'Add Employee',
        style: AppStyle.robotoBold20,
      ),
      toolbarHeight: 65,
    );
  }
}
