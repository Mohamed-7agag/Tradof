import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/company/profile_company/data/model/company_model.dart';

class UserImageAndInfo extends StatelessWidget {
  const UserImageAndInfo({
    super.key, required this.companyModel,
  });

  final CompanyModel companyModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(53),
              child: SizedBox(
                width: 70.w,
                height: 70.h,
                child: Image.asset('assets/images/photo3.jpg'),
              ),
            ),
            horizontalSpace(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 '${companyModel.firstName} ${companyModel.lastName}',
                  style: AppStyle.robotoSemiBold12
                      .copyWith(color: AppColors.white, fontSize: 15.sp),
                ),
                Text(
                  companyModel.email,
                  style: AppStyle.robotoRegular12
                      .copyWith(color: AppColors.white),
                ),
                Text(
                  companyModel.jobTitle,
                  style: AppStyle.robotoRegular12
                      .copyWith(color: AppColors.white),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            SvgPicture.asset('assets/images/edit.svg'),
            verticalSpace(30),
          ],
        )
      ],
    );
  }
}