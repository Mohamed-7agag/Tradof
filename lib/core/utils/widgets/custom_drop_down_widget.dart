import 'package:flutter/material.dart';

import '../../theming/app_colors.dart';
import '../../theming/app_style.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget({
    required this.hint,
    required this.items,
    super.key,
    this.value,
    this.onChanged,
    this.borderColor = AppColors.grey,
    this.focusedBorderColor = AppColors.white,
    this.textColor = AppColors.white,
    this.dropdownColor = AppColors.darkGrey,
    this.iconColor = AppColors.white,
  });

  final String hint;
  final List<String> items;
  final String? value;
  final void Function(String?)? onChanged;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color textColor;
  final Color dropdownColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: _buildBorder(color: borderColor),
        enabledBorder: _buildBorder(color: borderColor),
        focusedBorder: _buildBorder(color: focusedBorderColor),
      ),
      value: value,
      iconEnabledColor: iconColor,
      dropdownColor: dropdownColor,
      elevation: 4,
      hint: Text(
        hint,
        style: AppStyle.robotoRegular14.copyWith(
          color: textColor,
        ),
      ),
      items: items
          .map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: AppStyle.robotoRegular15.copyWith(
                  color: textColor,
                ),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }

  OutlineInputBorder _buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: color),
    );
  }
}
