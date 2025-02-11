import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/utils/models/country_model.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class CountryDropDown extends StatefulWidget {
  const CountryDropDown({
    super.key,
    required this.hint,
    required this.items,
    this.onChanged,
    this.borderColor = AppColors.white,
    this.textColor = AppColors.white,
    this.dropdownColor = AppColors.darkGrey,
    this.iconColor = AppColors.white,
    this.value,
  });

  final String hint;
  final List<CountryModel> items;
  final void Function(CountryModel?)? onChanged;
  final CountryModel? value;
  final Color borderColor;
  final Color textColor;
  final Color dropdownColor;
  final Color iconColor;

  @override
  State<CountryDropDown> createState() => _CountryDropDownState();
}

class _CountryDropDownState extends State<CountryDropDown> {
  CountryModel? selectedCountry;
  @override
  void initState() {
    super.initState();
    selectedCountry = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: widget.borderColor),
      ),
      child: DropdownButton<CountryModel>(
        iconEnabledColor: widget.iconColor,
        dropdownColor: widget.dropdownColor,
        isExpanded: true,
        menuWidth: 1.sw - 70,
        underline: const SizedBox.shrink(),
        borderRadius: BorderRadius.circular(10),
        elevation: 4,
        value: selectedCountry,
        hint: Text(
          widget.hint,
          style: AppStyle.robotoRegular14.copyWith(color: widget.textColor),
        ),
        items: widget.items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item.name,
                  style: AppStyle.robotoRegular15.copyWith(
                    color: widget.textColor,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedCountry = value;
            widget.onChanged?.call(value);
          });
        },
      ),
    );
  }
}
