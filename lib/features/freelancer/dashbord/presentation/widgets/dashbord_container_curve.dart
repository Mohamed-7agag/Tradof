import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

class DashbordContainerCurve extends StatelessWidget {
  const DashbordContainerCurve({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 210,
          decoration: BoxDecoration(
            color: AppColors.primary,
          ),
          child: SafeArea(
            child: Column(
              children: [
                verticalSpace(10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.white,
                      backgroundImage: AssetImage('assets/images/photo3.jpg'),
                    ),
                    title: Text(
                      'Youssef Ghareb',
                      style: AppStyle.poppinsMedium14
                          .copyWith(color: AppColors.white),
                    ),
                    subtitle: Text(
                      'J0esph',
                      style: AppStyle.robotoRegular10
                          .copyWith(color: AppColors.white),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/bell2.png',width: 22),
                        horizontalSpace(18),
                        Image.asset('assets/images/calendar.png',width: 22),
                        horizontalSpace(4),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 170,
          left: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.r),
            child: Container(
              height: 115.h,
              decoration: BoxDecoration(
                color: AppColors.background,
              ),
            ),
          ),
        ),
        Positioned(
          top: 127.h,
          left: 25.w,
          right: 25.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 65.h,
              decoration: BoxDecoration(
                color: AppColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      verticalSpace(15),
                      SvgPicture.asset('assets/images/category_color.svg'),
                      Text(
                        'Current project',
                        style: AppStyle.robotoSemiBold10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      verticalSpace(15),
                      SvgPicture.asset('assets/images/save.svg'),
                      Text(
                        'All project',
                        style: AppStyle.robotoSemiBold10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
