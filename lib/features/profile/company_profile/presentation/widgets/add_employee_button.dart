import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/app_validation.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../../core/utils/widgets/custom_toastification.dart';
import '../../data/model/company_employee_request_model.dart';
import '../logic/company_profile_cubit/company_profile_cubit.dart';

class AddEmployeeButton extends StatelessWidget {
  const AddEmployeeButton({
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.jobTitleController,
    required this.phoneNumberController,
    required this.formKey,
    super.key,
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
      listenWhen: (previous, current) => _listenAndBuildWhen(current),
      buildWhen: (previous, current) => _listenAndBuildWhen(current),
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
            ? const CustomLoadingWidget()
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

  bool _listenAndBuildWhen(CompanyProfileState current) {
    return current.status.isAddCompanyEmployeesSuccess ||
        current.status.isAddCompanyEmployeesFailure ||
        current.status.isAddCompanyEmployeesLoading;
  }

  void _addEmployeeValidation(CompanyProfileState state, BuildContext context) {
    final groupName = context.read<CompanyProfileCubit>().state.groupName;
    final countryId = context.read<CompanyProfileCubit>().state.countryId;
    final password = passwordController.text.trim();
    if (formKey.currentState!.validate()) {
      if (!AppValidation.emailValidation(
          context, emailController.text.trim())) {
      } else if (!AppValidation.passwordValidation(context, password) ||
          !AppValidation.phoneNumberValidation(
              context, phoneNumberController.text.trim())) {
      } else if (groupName.isNullOrEmpty()) {
        errorToast(context, 'Error', 'Please Select Group Name');
      } else if (countryId == null) {
        errorToast(context, 'Error', 'Please Select Country');
      } else {
        final companyEmployeeModel = CompanyEmployeeRequestModel(
          jobTitle: jobTitleController.text.trim(),
          countryId: countryId,
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          phoneNumber: phoneNumberController.text.trim(),
          email: emailController.text.trim(),
          password: password,
          groupName: groupName!,
          companyId: AppConstants.kUserId,
        );
        context
            .read<CompanyProfileCubit>()
            .addCompanyEmployee(employeeModel: companyEmployeeModel);
      }
    }
  }
}
