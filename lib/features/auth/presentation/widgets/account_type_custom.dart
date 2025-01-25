import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_style.dart';


class AccountTypeCustom extends StatelessWidget {
  const AccountTypeCustom({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 35.w,
          height: 35.h,
          child: SvgPicture.asset(
            image,
            width: 70.w,
          ),
        ),
        horizontalSpace(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyle.poppinsSemiBold14,
            ),
            SizedBox(
              width: 223.w,
              child: Text(
                description,
                style: AppStyle.epilogueRegular14.copyWith(
                  letterSpacing: 0.1,
                ),
                maxLines: description.length,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
