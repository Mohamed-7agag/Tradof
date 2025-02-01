import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

class UserImageAndInfo extends StatelessWidget {
  const UserImageAndInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 26.r,
        backgroundColor: AppColors.white,
        backgroundImage: AssetImage('assets/images/photo3.jpg'),
      ),
      title: Text(
        'Youssef Ghareb',
        style: AppStyle.robotoSemiBold12
            .copyWith(color: AppColors.white, fontSize: 15.sp),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'youssef.ghareb@tradof.com',
            style: AppStyle.robotoRegular12.copyWith(color: AppColors.white),
          ),
          Text(
            'Company',
            style: AppStyle.robotoRegular12.copyWith(color: AppColors.white),
          ),
        ],
      ),
      trailing: SvgPicture.asset('assets/images/edit.svg'),
    );
  }
}
