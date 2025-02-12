import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/core/helpers/app_validation.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/utils/app_constants.dart';
import 'package:tradof/core/utils/widgets/custom_loading_widget.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';
import 'package:tradof/features/company/company_profile/data/model/company_employee_request_model.dart';
import 'package:tradof/features/company/company_profile/presentation/logic/company_profile_cubit/company_profile_cubit.dart';

import '../../../../../core/utils/widgets/custom_button.dart';

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
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController jobTitleController;
  final TextEditingController phoneNumberController;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyProfileCubit, CompanyProfileState>(
      listener: (context, state) {
        if (state.status.isAddCompanyEmployeesSuccess) {
          successToast(context, 'Success', state.message);
         context.pop(result: true);
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
                  _addEmployeeValidation(state, context);
                },
              );
      },
    );
  }

  void _addEmployeeValidation(CompanyProfileState state, BuildContext context) {
    final password = passwordController.text.trim();
    if (formKey.currentState!.validate()) {
      if (!AppValidation.emailValidation(
          context, emailController.text.trim())) {
      } else if (!AppValidation.passwordValidation(context, password) ||
          !AppValidation.phoneNumberValidation(
              context, phoneNumberController.text.trim())) {
      } else if (state.groupName.isNullOrEmpty()) {
        errorToast(context, 'Error', 'Please Select Group Name');
      } else if (state.countryId == null) {
        errorToast(context, 'Error', 'Please Select Country');
      } else {
        final companyEmployeeModel = CompanyEmployeeRequestModel(
          jobTitle: jobTitleController.text.trim(),
          countryId: state.countryId!,
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          phoneNumber: phoneNumberController.text.trim(),
          email: emailController.text.trim(),
          password: password,
          groupName: state.groupName!,
          companyId: AppConstants.kUserId,
        );
        context
            .read<CompanyProfileCubit>()
            .addCompanyEmployee(employeeModel: companyEmployeeModel);
      }
    }
  }
}
