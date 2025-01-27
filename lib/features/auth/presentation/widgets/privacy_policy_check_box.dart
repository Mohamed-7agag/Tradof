import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class PrivacyPolicyCheckBox extends StatefulWidget {
  const PrivacyPolicyCheckBox({super.key, required this.onChanged});
  final Function(bool) onChanged;
  @override
  State<PrivacyPolicyCheckBox> createState() => _PrivacyPolicyCheckBoxState();
}

class _PrivacyPolicyCheckBoxState extends State<PrivacyPolicyCheckBox> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CheckboxListTile(
        value: checked,
        onChanged: (val) {
          setState(() {
            checked = val!;
            widget.onChanged(checked);
          });
        },
        title: Text(
          "I agree to the Terms of Service and Privacy Policy.",
          style: AppStyle.robotoRegular10.copyWith(color: AppColors.white),
        ),
        checkboxShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(color: AppColors.white),
        selectedTileColor: AppColors.primary,
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: AppColors.white,
        checkColor: AppColors.primary,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
