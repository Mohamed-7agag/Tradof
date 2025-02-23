import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import 'status_item.dart';

class ProjectWorkspaceStatusSection extends StatelessWidget {
  const ProjectWorkspaceStatusSection({required this.status, super.key});
  final int status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(color: Colors.grey[200]!, blurRadius: 4),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatusItem(status: status, index: 0),
          StatusItem(status: status, index: 1),
          StatusItem(status: status, index: 2),
        ],
      ),
    );
  }
}
