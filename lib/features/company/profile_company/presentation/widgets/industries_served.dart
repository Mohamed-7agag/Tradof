import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/auth/data/model/specialization_model.dart';

class IndustriesServed extends StatelessWidget {
 const IndustriesServed({super.key, required this.fileds});

  final List<SpecializationModel> fileds;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Industries Served', style: AppStyle.poppinsMedium15),
              SvgPicture.asset('assets/images/add.svg')
            ],
          ),
          verticalSpace(10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 30.w, right: 45.w, bottom: 15.h),
                  child: Text(
                    "Field",
                    style: AppStyle.robotoBold20
                        .copyWith(color: AppColors.primary, fontSize: 12.sp),
                  ),
                ),
                Column(
                  children: fileds.map((filed) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 45.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/close.svg',
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                  SizedBox(width: 6),
                                  Text(filed.name, style: AppStyle.robotoRegular12),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (filed != fileds.last)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 17.w),
                            child: Divider(),
                          ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
