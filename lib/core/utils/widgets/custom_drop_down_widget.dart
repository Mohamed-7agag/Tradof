import 'package:flutter/material.dart';

import '../../theming/app_colors.dart';
import '../../theming/app_style.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget({
    super.key,
    required this.hint,
    required this.items,
    this.value,
    this.onChanged,
  });
  final String hint;
  final List<String> items;
  final String? value;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(color: AppColors.white),
      ),
      value: value,
      iconEnabledColor: AppColors.white,
      style: AppStyle.poppinsMedium14.copyWith(color: AppColors.white),
      dropdownColor: AppColors.darkGrey,
      elevation: 4,
      hint: Text(
        hint,
        style: AppStyle.robotoRegular14.copyWith(color: AppColors.white),
      ),
      items: items
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e, style: AppStyle.poppinsMedium14),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }

  OutlineInputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? AppColors.grey),
    );
  }
}
