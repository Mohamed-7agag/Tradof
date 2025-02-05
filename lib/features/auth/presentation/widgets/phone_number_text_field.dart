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
    this.borderColor,
    this.labelBehavior = false,
    this.outlineBorder = false,
  });

  final String labelText;
  final TextEditingController controller;
  final Color? borderColor;
  final bool? labelBehavior;
  final bool outlineBorder;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      cursorColor: borderColor ?? AppColors.white,
      cursorRadius: Radius.circular(10),
      controller: controller,
      initialCountryCode: 'EG',
      dropdownTextStyle: TextStyle(color: borderColor ?? AppColors.white),
      dropdownIcon:
          Icon(Icons.arrow_drop_down, color: borderColor ?? AppColors.white),
      pickerDialogStyle: PickerDialogStyle(
        searchFieldCursorColor: AppColors.primary,
        listTileDivider: Divider(height: 0),
      ),
      style: AppStyle.robotoRegular15
          .copyWith(color: borderColor ?? AppColors.white),
      validator: (value) {
        if (value == null || value.completeNumber.isNullOrEmpty()) {
          return 'required';
        }
        return null;
      },
      decoration: InputDecoration(
        counterStyle: TextStyle(color: borderColor ?? AppColors.white),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedErrorBorder: _buildBorder(),
        focusedBorder: _buildBorder(color: AppColors.darkGrey),
        errorBorder: _buildBorder(color: Colors.red),
        label: Text(
          labelText,
          style: AppStyle.robotoRegular14
              .copyWith(color: borderColor ?? AppColors.white),
        ),
        floatingLabelStyle: TextStyle(color: AppColors.primary),
        floatingLabelBehavior: labelBehavior == true
            ? FloatingLabelBehavior.never
            : FloatingLabelBehavior.auto,
      ),
    );
  }

  _buildBorder({Color? color}) {
    return outlineBorder
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: color ?? AppColors.grey),
          )
        : UnderlineInputBorder(
            borderSide:
                BorderSide(color: color ?? borderColor ?? AppColors.white),
          );
  }
}
