import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tradof/core/helpers/app_regex.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/utils/app_constants.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';
import 'package:tradof/features/company/company_profile/data/model/company_employee_request_model.dart';
import 'package:tradof/features/company/company_profile/presentation/logic/company_profile_cubit/company_profile_cubit.dart';

import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../auth/presentation/logic/freelancer_registeration_cubit.dart';

class AddEmployeeButton extends StatelessWidget {
  const AddEmployeeButton({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.jobTitleController,
    required this.phoneNumberController,
    required this.formKey,
    required this.groupName,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController jobTitleController;
  final TextEditingController phoneNumberController;
  final String groupName;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyProfileCubit, CompanyProfileState>(
      listener: (context, state) {
        if (state.status.isAddCompanyEmployeesSuccess) {
          successToast(context, 'Success', state.message);
          GoRouter.of(context).pop(true);
        } else if (state.status.isAddCompanyEmployeesFailure) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isAddCompanyEmployeesLoading
            ? CustomLoadingWidget()
            : CustomButton(
                text: 'Add',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _addEmployeeValidation(context);
                },
              );
      },
    );
  }

  void _addEmployeeValidation(BuildContext context) {
    final password = passwordController.text.trim();
    if (formKey.currentState!.validate()) {
      if (!AppRegex.isEmailValid(emailController.text.trim())) {
        errorToast(context, 'Error', 'Please enter valid email');
      } else if (!AppRegex.hasMinLength(password)) {
        errorToast(context, 'Invalid Password',
            'Password must be at least 8 characters long');
      } else if (!AppRegex.hasLowerCase(password)) {
        errorToast(context, 'Invalid Password',
            'Password must contain at least one lowercase letter');
      } else if (!AppRegex.hasUpperCase(password)) {
        errorToast(context, 'Invalid Password',
            'Password must contain at least one upper letter');
      } else if (!AppRegex.hasNumber(password)) {
        errorToast(context, 'Invalid Password',
            'Password must contain at least one number digit');
      } else if (!AppRegex.hasSpecialCharacter(password)) {
        errorToast(context, 'Invalid Password',
            'Password must contain at least one special character');
      } else if (phoneNumberController.text.trim().isNullOrEmpty()) {
        errorToast(
            context, 'Invalid Phone Number', 'Please enter valid Phone Number');
      } else if (groupName.isNullOrEmpty()) {
        errorToast(context, 'Error', 'Please Select Group Name');
      } else if (context.read<ProfileImageAndCountryCubit>().state.countryId ==
          null) {
        errorToast(context, 'Error', 'Please Select Country');
      } else {
        final companyEmployeeModel = CompanyEmployeeRequestModel(
          jobTitle: jobTitleController.text.trim(),
          countryId:
              context.read<ProfileImageAndCountryCubit>().state.countryId!,
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          phoneNumber: phoneNumberController.text.trim(),
          email: emailController.text.trim(),
          password: password,
          groupName: groupName,
          companyId: AppConstants.kUserId,
        );
        context
            .read<CompanyProfileCubit>()
            .addCompanyEmployee(employeeModel: companyEmployeeModel);
      }
    }
  }
}
