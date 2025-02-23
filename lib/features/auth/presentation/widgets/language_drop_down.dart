import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/models/language_model.dart';

class LanguageDropDown extends StatefulWidget {
  const LanguageDropDown({
    required this.hint,
    required this.items,
    super.key,
    this.onChanged,
    this.borderColor,
    this.hintColor,
    this.value,
    this.isEditable = true,
  });
  final String hint;
  final List<LanguageModel> items;
  final void Function(LanguageModel?)? onChanged;
  final Color? borderColor;
  final Color? hintColor;
  final LanguageModel? value;
  final bool isEditable;

  @override
  State<LanguageDropDown> createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown> {
  LanguageModel? selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: widget.borderColor ?? AppColors.white),
      ),
      child: DropdownButton<LanguageModel>(
        iconEnabledColor: widget.borderColor ?? AppColors.white,
        dropdownColor:
            widget.borderColor != null ? AppColors.white : AppColors.darkGrey,
        isExpanded: true,
        menuWidth: 1.sw - 60,
        menuMaxHeight: 0.8.sh,
        underline: const SizedBox.shrink(),
        elevation: 4,
        value: selectedLanguage,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                  '${item.languageName} (${item.countryName})',
                  style: AppStyle.robotoRegular15.copyWith(
                    color: widget.hintColor ?? AppColors.white,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: widget.isEditable
            ? (value) {
                setState(() {
                  selectedLanguage = value;
                  widget.onChanged!(value);
                });
              }
            : null,
      ),
    );
  }
}
