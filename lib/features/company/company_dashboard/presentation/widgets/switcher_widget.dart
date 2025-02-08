import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';

class SwitcherWidget extends StatelessWidget {
  const SwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13),
      width: 0.86.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
          Column(
            children: [
              SvgPicture.asset(
                'assets/images/category_color.svg',
              ),
              verticalSpace(3),
              Text(
                'Current project',
                style: AppStyle.robotoSemiBold10,
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset('assets/images/save.svg'),
              verticalSpace(3),
              Text(
                'All project',
                style: AppStyle.robotoSemiBold10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
