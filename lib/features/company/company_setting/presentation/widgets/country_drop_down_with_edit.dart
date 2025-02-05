import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/auth/data/model/country_model.dart';

class CountryDropDownWithEdit extends StatefulWidget {
  const CountryDropDownWithEdit({
    super.key,
    required this.hint,
    required this.items,
    this.value,
    this.onChanged,
  });

  final String hint;
  final List<CountryModel> items;
  final CountryModel? value;
  final void Function(CountryModel?)? onChanged;

  @override
  State<CountryDropDownWithEdit> createState() =>
      _CountryDropDownWithEditState();
}

class _CountryDropDownWithEditState extends State<CountryDropDownWithEdit> {
  CountryModel? selectedCountry;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.value;
  }

  @override
  void didUpdateWidget(covariant CountryDropDownWithEdit oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      setState(() => selectedCountry = widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkGrey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<CountryModel>(
        iconEnabledColor: AppColors.darkGrey,
        dropdownColor: AppColors.white,
        isExpanded: true,
        menuWidth: 1.sw - 70,
        underline: const SizedBox.shrink(),
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
            widget.onChanged?.call(value);
          });
        },
      ),
    );
  }
}
