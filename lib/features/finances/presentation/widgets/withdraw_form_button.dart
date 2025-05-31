import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../data/model/withdrawal_model.dart';
import '../logic/cubit/finances_cubit.dart';

class WithdrawFormButton extends StatelessWidget {
  const WithdrawFormButton({
    required this.beneficialNameController,
    required this.ibanController,
    required this.swiftOrBicController,
    required this.addressLine1Controller,
    required this.addressLine2Controller,
    required this.cityController,
    required this.stateController,
    required this.postalCodeController,
    required this.countryController,
    required this.withdrawAmount,
    super.key,
  });
  final TextEditingController beneficialNameController;
  final TextEditingController ibanController;
  final TextEditingController swiftOrBicController;
  final TextEditingController addressLine1Controller;
  final TextEditingController addressLine2Controller;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController postalCodeController;
  final TextEditingController countryController;
  final double withdrawAmount;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FinancesCubit, FinancesState>(
      listenWhen: (previous, current) => _listenAndBuildWhen(current),
      buildWhen: (previous, current) => _listenAndBuildWhen(current),
      listener: (context, state) {
        if (state.status.isWithdrawalSuccess) {
          successToast(
            context,
            'Success',
            'Withdrawal request submitted successfully',
          );
          context.pop();
          context.pop();
        } else if (state.status.isWithdrawalFailure) {
          errorToast(context, 'Error', state.errorMessage);
        }
      },
      builder: (context, state) {
        return state.status.isWithdrawalLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Submit Form',
                onPressed: () {
                  _withdrawFormValidation(context);
                },
                width: 1,
              );
      },
    );
  }

  bool _listenAndBuildWhen(FinancesState state) {
    return state.status.isWithdrawalFailure ||
        state.status.isWithdrawalLoading ||
        state.status.isWithdrawalSuccess;
  }

  void _withdrawFormValidation(BuildContext context) {
    if (beneficialNameController.text.trim().isEmpty ||
        ibanController.text.trim().isEmpty ||
        swiftOrBicController.text.trim().isEmpty ||
        addressLine1Controller.text.trim().isEmpty ||
        cityController.text.trim().isEmpty ||
        stateController.text.trim().isEmpty ||
        countryController.text.trim().isEmpty) {
      errorToast(context, 'Error', 'Please fill all fields');
    } else if (!context.read<FinancesCubit>().state.withdrawCheckboxValue1 ||
        !context.read<FinancesCubit>().state.withdrawCheckboxValue2 ||
        !context.read<FinancesCubit>().state.withdrawCheckboxValue3) {
      errorToast(context, 'Error', 'Please agree to all terms and conditions');
    } else {
      final WithdrawalModel withdrawalModel = WithdrawalModel(
        amount: withdrawAmount,
        name: beneficialNameController.text,
        iban: ibanController.text,
        swiftCode: swiftOrBicController.text,
        addressLine1: addressLine1Controller.text,
        addressLine2: addressLine2Controller.text,
        city: cityController.text,
        state: stateController.text,
        postalCode: postalCodeController.text,
        country: countryController.text,
      );
      context
          .read<FinancesCubit>()
          .submitWithdraw(withdrawalModel: withdrawalModel);
    }
  }
}
