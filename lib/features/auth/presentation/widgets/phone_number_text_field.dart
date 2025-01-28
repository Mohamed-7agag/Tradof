import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tradof/core/helpers/extensions.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
    required this.labelText,
    required this.controller,
  });

  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      cursorColor: AppColors.white,
      cursorRadius: Radius.circular(10),
      controller: controller,
      initialCountryCode: 'EG',
      dropdownTextStyle: TextStyle(color: AppColors.white),
      dropdownIcon: Icon(Icons.arrow_drop_down, color: AppColors.white),
      pickerDialogStyle: PickerDialogStyle(
        searchFieldCursorColor: AppColors.primary,
        listTileDivider: Divider(height: 0),
      ),
      style: AppStyle.robotoRegular15.copyWith(color: AppColors.white),
      validator: (value) {
        if (value == null || value.completeNumber.isNullOrEmpty()) {
          return 'required';
        }
        return null;
      },
      decoration: InputDecoration(
        counterStyle: TextStyle(color: AppColors.white),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedErrorBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        errorBorder: _buildBorder(color: Colors.red),
        label: Text(
          labelText,
          style: AppStyle.robotoRegular14.copyWith(color: AppColors.white),
        ),
        floatingLabelStyle: TextStyle(color: AppColors.primary),
      ),
    );
  }

  _buildBorder({Color? color}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.white),
    );
  }
}
