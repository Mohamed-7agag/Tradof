import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../logic/cubit/finances_cubit.dart';
import '../widgets/withdraw_form_button.dart';
import '../widgets/withdraw_form_checkbox.dart';
import '../widgets/withdraw_form_item.dart';

class WithdrawFormView extends StatefulWidget {
  const WithdrawFormView({required this.withdrawAmount, super.key});
  final double withdrawAmount;
  @override
  State<WithdrawFormView> createState() => _WithdrawFormViewState();
}

class _WithdrawFormViewState extends State<WithdrawFormView> {
  late TextEditingController _beneficialNameController;
  late TextEditingController _ibanController;
  late TextEditingController _swiftOrBicController;
  late TextEditingController _addressLine1Controller;
  late TextEditingController _addressLine2Controller;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _postalCodeController;
  late TextEditingController _countryController;

  @override
  void initState() {
    super.initState();
    _beneficialNameController = TextEditingController();
    _ibanController = TextEditingController();
    _swiftOrBicController = TextEditingController();
    _addressLine1Controller = TextEditingController();
    _addressLine2Controller = TextEditingController();
    _cityController = TextEditingController();
    _stateController = TextEditingController();
    _postalCodeController = TextEditingController();
    _countryController = TextEditingController();
  }

  @override
  void dispose() {
    _beneficialNameController.dispose();
    _ibanController.dispose();
    _swiftOrBicController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _postalCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Withdraw Form',
        actionIcon: HugeIcons.strokeRoundedCreditCardPos,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              verticalSpace(16),
              WithdrawFormItem(
                controller: _beneficialNameController,
                hintText: 'Enter your beneficial name',
                labelText: 'Beneficial Name',
              ),
              verticalSpace(14),
              WithdrawFormItem(
                controller: _ibanController,
                hintText: 'Enter your IBAN',
                labelText: 'IBAN',
              ),
              verticalSpace(14),
              WithdrawFormItem(
                controller: _swiftOrBicController,
                hintText: 'Enter SWIFT/BIC code',
                labelText: 'SWIFT/BIC Code',
              ),
              verticalSpace(14),
              WithdrawFormItem(
                controller: _addressLine1Controller,
                hintText: 'Enter address line 1',
                labelText: 'Address Line 1',
              ),
              verticalSpace(14),
              WithdrawFormItem(
                controller: _addressLine2Controller,
                hintText: 'Enter address line 2',
                labelText: 'Address Line 2',
              ),
              verticalSpace(14),
              WithdrawFormItem(
                controller: _cityController,
                hintText: 'Enter your city',
                labelText: 'City',
              ),
              verticalSpace(14),
              WithdrawFormItem(
                controller: _stateController,
                hintText: 'Enter your state/province',
                labelText: 'State/Province',
              ),
              verticalSpace(14),
              WithdrawFormItem(
                controller: _countryController,
                hintText: 'Enter your country',
                labelText: 'Country',
              ),
              verticalSpace(14),
              WithdrawFormItem(
                controller: _postalCodeController,
                hintText: 'Enter postal code',
                labelText: 'Postal Code',
                isRequired: false,
              ),
              verticalSpace(16),
              WithdrawFormCheckbox(
                title: 'I confirm that the beneficiary information is correct',
                onChanged: (bool value) {
                  context
                      .read<FinancesCubit>()
                      .setWithdrawCheckboxValues(value1: value);
                },
              ),
              WithdrawFormCheckbox(
                title:
                    'I understand that the withdrawal process may take up to 5 business days',
                onChanged: (bool value) {
                  context
                      .read<FinancesCubit>()
                      .setWithdrawCheckboxValues(value2: value);
                },
              ),
              WithdrawFormCheckbox(
                title:
                    'I accept the terms and conditions of the withdrawal process',
                onChanged: (bool value) {
                  context
                      .read<FinancesCubit>()
                      .setWithdrawCheckboxValues(value3: value);
                },
              ),
              verticalSpace(24),
              WithdrawFormButton(
                withdrawAmount: widget.withdrawAmount,
                beneficialNameController: _beneficialNameController,
                ibanController: _ibanController,
                swiftOrBicController: _swiftOrBicController,
                addressLine1Controller: _addressLine1Controller,
                addressLine2Controller: _addressLine2Controller,
                cityController: _cityController,
                stateController: _stateController,
                postalCodeController: _postalCodeController,
                countryController: _countryController,
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
