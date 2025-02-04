import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/features/auth/data/model/language_model.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class LanguagePairDropDown extends StatefulWidget {
  const LanguagePairDropDown({
    super.key,
    required this.hint,
    required this.items,
    this.onChanged,
    this.borderColor,
    this.hintColor,
  });
  final String hint;
  final List<LanguageModel> items;
  final void Function(LanguageModel?)? onChanged;
  final Color? borderColor;
  final Color? hintColor;

  @override
  State<LanguagePairDropDown> createState() => _LanguagePairDropDownState();
}

class _LanguagePairDropDownState extends State<LanguagePairDropDown> {
  LanguageModel? selectedLanguage;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: widget.borderColor ?? AppColors.white),
      ),
      child: DropdownButton<LanguageModel>(
        iconEnabledColor: widget.borderColor ?? AppColors.white,
        dropdownColor: widget.borderColor != null ? AppColors.white : AppColors.darkGrey,
        isExpanded: true,
        menuWidth: 1.sw - 70,
        underline: SizedBox.shrink(),
        elevation: 4,
        value: selectedLanguage,
        hint: Text(
          widget.hint,
          style: AppStyle.robotoRegular14
              .copyWith(color: widget.hintColor ?? AppColors.white),
        ),
        items: widget.items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(
                  '${item.languageName} (${item.languageCode})',
                  style: AppStyle.robotoRegular15.copyWith(
                    color: widget.hintColor ?? AppColors.white,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedLanguage = value;
            widget.onChanged!(value);
          });
        },
      ),
    );
  }
}
