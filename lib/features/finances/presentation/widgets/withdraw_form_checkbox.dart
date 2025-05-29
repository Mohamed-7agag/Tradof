import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class WithdrawFormCheckbox extends StatefulWidget {
  const WithdrawFormCheckbox(
      {required this.onChanged, required this.title, super.key});
  final Function(bool) onChanged;
  final String title;
  @override
  State<WithdrawFormCheckbox> createState() => _WithdrawFormCheckboxState();
}

class _WithdrawFormCheckboxState extends State<WithdrawFormCheckbox> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: checked,
      onChanged: (val) {
        setState(() {
          checked = val!;
          widget.onChanged(checked);
        });
      },
      title: Text(
        widget.title,
        style: AppStyle.robotoRegular12,
      ),
      checkboxShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      side: const BorderSide(color: AppColors.darkGrey),
      selectedTileColor: AppColors.primary,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: AppColors.primary,
      checkColor: AppColors.white,
      contentPadding: EdgeInsets.zero,
    );
  }
}
