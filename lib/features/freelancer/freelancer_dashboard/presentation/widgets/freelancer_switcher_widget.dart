import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';

class FreelancerSwitcherWidget extends StatefulWidget {
  const FreelancerSwitcherWidget({required this.onSwitch, super.key});
  final void Function(int index) onSwitch;
  @override
  State<FreelancerSwitcherWidget> createState() =>
      _FreelancerSwitcherWidgetState();
}

class _FreelancerSwitcherWidgetState extends State<FreelancerSwitcherWidget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13),
      width: 0.85.sw,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 0.25,
          ),
        ],
        color: AppColors.white,
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
                  'Current project',
                  style: AppStyle.robotoSemiBold10,
                ),
              ],
            ),
          ),
          InkWell(
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
                  'All project',
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
