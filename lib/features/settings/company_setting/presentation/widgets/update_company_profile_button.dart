import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../../core/utils/widgets/custom_toastification.dart';
import '../../../../profile/company_profile/data/model/company_model.dart';
import '../logic/company_setting_cubit/company_setting_cubit.dart';

class UpdateCompanyProfileButton extends StatelessWidget {
  const UpdateCompanyProfileButton({
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneNumberController,
    required this.locationCompanyController,
    required this.companyModel,
    required this.companyNameController,
    super.key,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController locationCompanyController;
  final TextEditingController companyNameController;
  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanySettingCubit, CompanySettingState>(
      listenWhen: (previous, current) => _listenAndBuildWhen(current),
      buildWhen: (previous, current) => _listenAndBuildWhen(current),
      listener: (context, state) {
        if (state.status.isUpdateCompanyProfileSuccess) {
          successToast(context, 'Success', state.message);
          context.pop(result: true);
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
                  await _updateCompanyProfile(context);
                },
              );
      },
    );
  }

  bool _listenAndBuildWhen(CompanySettingState current) {
    return current.status.isUpdateCompanyProfileLoading ||
        current.status.isUpdateCompanyProfileFailure ||
        current.status.isUpdateCompanyProfileSuccess;
  }

  Future<void> _updateCompanyProfile(BuildContext context) async {
    context.read<CompanySettingCubit>().updateCompanyProfile(
          firstNameController.text.trim(),
          lastNameController.text.trim(),
          companyNameController.text.trim(),
          locationCompanyController.text.trim(),
          phoneNumberController.text.trim(),
          companyModel,
        );
  }
}
