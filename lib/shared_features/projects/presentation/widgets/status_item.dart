import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class StatusItem extends StatelessWidget {
  const StatusItem({
    required this.status,
    required this.index,
    super.key,
  });
  final int status;
  final int index;
  @override
  Widget build(BuildContext context) {
    return status == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              color: getStatusColor(index),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HugeIcon(
                  icon: getStatusIcon(index),
                  color: AppColors.white,
                  size: 20,
                ),
                horizontalSpace(8),
                Text(
                  getStatusName(index),
                  style:
                      AppStyle.robotoRegular14.copyWith(color: AppColors.white),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: HugeIcon(
              icon: getStatusIcon(index),
              color: Colors.grey,
              size: 20,
            ),
          );
  }

  Color getStatusColor(int status) {
    switch (status) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.orange;
      default:
        return Colors.white;
    }
  }

  String getStatusName(int status) {
    switch (status) {
      case 0:
        return 'Work';
      case 1:
        return 'Review';
      case 2:
        return 'Finished';
      default:
        return '';
    }
  }

  IconData getStatusIcon(int status) {
    switch (status) {
      case 0:
        return HugeIcons.strokeRoundedTranslate;
      case 1:
        return HugeIcons.strokeRoundedTimer02;
      case 2:
        return HugeIcons.strokeRoundedCheckList;
      default:
        return HugeIcons.strokeRoundedTranslate;
    }
  }
}
