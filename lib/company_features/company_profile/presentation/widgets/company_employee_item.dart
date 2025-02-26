import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../data/model/company_employee_model.dart';

class CompanyEmployeeItem extends StatelessWidget {
  const CompanyEmployeeItem({required this.employeeModel, super.key});
  final CompanyEmployeeModel employeeModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 10,
            leading: const HugeIcon(
              icon: HugeIcons.strokeRoundedUserStory,
              color: AppColors.primary,
              size: 45,
            ),
            title: Text(
              employeeModel.fullName,
              style: AppStyle.poppinsMedium14,
            ),
            subtitle: Text(
              employeeModel.email,
              style: AppStyle.robotoRegular12,
            ),
          ),
          verticalSpace(10),
          Row(
            children: [
              const HugeIcon(
                icon: HugeIcons.strokeRoundedJobLink,
                color: AppColors.primary,
                size: 21,
              ),
              horizontalSpace(10),
              Text(employeeModel.jobTitle),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              const HugeIcon(
                icon: HugeIcons.strokeRoundedCall,
                color: AppColors.primary,
                size: 21,
              ),
              horizontalSpace(10),
              Text(employeeModel.phoneNumber),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              const HugeIcon(
                icon: HugeIcons.strokeRoundedUserMultiple,
                color: AppColors.primary,
                size: 21,
              ),
              horizontalSpace(10),
              Text(employeeModel.groupName),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              const HugeIcon(
                icon: HugeIcons.strokeRoundedCity01,
                color: AppColors.primary,
                size: 21,
              ),
              horizontalSpace(10),
              Text(employeeModel.country),
            ],
          ),
          verticalSpace(14),
        ],
      ),
    );
  }
}
