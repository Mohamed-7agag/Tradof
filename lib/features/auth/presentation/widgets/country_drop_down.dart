import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/features/auth/data/model/country_model.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class CountryDropDown extends StatefulWidget {
  const CountryDropDown({
    super.key,
    required this.hint,
    required this.items,
    this.onChanged,
  });
  final String hint;
  final List<CountryModel> items;
  final void Function(CountryModel?)? onChanged;

  @override
  State<CountryDropDown> createState() => _CountryDropDownState();
}

class _CountryDropDownState extends State<CountryDropDown> {
  CountryModel? selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.white),
      ),
      child: DropdownButton<CountryModel>(
        iconEnabledColor: AppColors.white,
        dropdownColor: AppColors.darkGrey,
        isExpanded: true,
        menuWidth: 1.sw - 70,
        underline: SizedBox.shrink(),
        borderRadius: BorderRadius.circular(10),
        elevation: 4,
        value: selectedCountry,
        hint: Text(
          widget.hint,
          style: AppStyle.robotoRegular14.copyWith(color: AppColors.white),
        ),
        items: widget.items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item.name,
                  style: AppStyle.robotoRegular15.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedCountry = value;
            widget.onChanged!(value);
          });
        },
      ),
    );
  }
}

class CountryDarkBorderDropDown extends StatefulWidget {
  const CountryDarkBorderDropDown({
    super.key,
    required this.hint,
    required this.items,
    this.onChanged,
  });
  final String hint;
  final List<CountryModel> items;
  final void Function(CountryModel?)? onChanged;

  @override
  State<CountryDarkBorderDropDown> createState() =>
      _CountryDarkBorderDropDownState();
}

class _CountryDarkBorderDropDownState extends State<CountryDarkBorderDropDown> {
  CountryModel? selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey),
      ),
      child: DropdownButton<CountryModel>(
        iconEnabledColor: AppColors.darkGrey,
        dropdownColor: AppColors.white,
        isExpanded: true,
        menuWidth: 1.sw - 70,
        underline: SizedBox.shrink(),
        borderRadius: BorderRadius.circular(10),
        elevation: 4,
        value: selectedCountry,
        hint: Text(
          widget.hint,
          style: AppStyle.robotoRegular14.copyWith(color: AppColors.darkGrey),
        ),
        items: widget.items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item.name,
                  style: AppStyle.robotoRegular15.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedCountry = value;
            widget.onChanged!(value);
          });
        },
      ),
    );
  }
}
