import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class CompanySwitcherWidget extends StatefulWidget {
  const CompanySwitcherWidget({required this.onSwitch, super.key});
  final void Function(int index) onSwitch;
  @override
  State<CompanySwitcherWidget> createState() => _CompanySwitcherWidgetState();
}

class _CompanySwitcherWidgetState extends State<CompanySwitcherWidget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13),
      width: 0.85.sw,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 0.25,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              if (index != 0) {
                setState(() => index = 0);
                widget.onSwitch(index);
              }
            },
            child: Column(
              children: [
                SvgPicture.asset(
                  index == 0
                      ? 'assets/images/category_color.svg'
                      : 'assets/images/category.svg',
                ),
                verticalSpace(3),
                Text(
                  'Started project',
                  style: AppStyle.robotoSemiBold10,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (index != 1) {
                setState(() => index = 1);
                widget.onSwitch(index);
              }
            },
            child: Column(
              children: [
                SvgPicture.asset(
                  index == 1
                      ? 'assets/images/save_color.svg'
                      : 'assets/images/save.svg',
                ),
                verticalSpace(3),
                Text(
                  'Upcoming project',
                  style: AppStyle.robotoSemiBold10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
