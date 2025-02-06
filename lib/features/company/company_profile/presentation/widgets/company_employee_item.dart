import 'package:flutter/material.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

import '../../data/model/company_employee_model.dart';

class CompanyEmployeeItem extends StatelessWidget {
  const CompanyEmployeeItem({super.key, required this.employeeModel});
  final CompanyEmployeeModel employeeModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.account_circle,
              size: 50,
              color: AppColors.primary,
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
              Icon(Icons.business_center_sharp, color: AppColors.primary),
              horizontalSpace(10),
              Text(employeeModel.jobTitle),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              Icon(Icons.phone, color: AppColors.primary),
              horizontalSpace(10),
              Text(employeeModel.phoneNumber),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              Icon(Icons.group, color: AppColors.primary),
              horizontalSpace(10),
              Text(employeeModel.groupName),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              Icon(Icons.flag, color: AppColors.primary),
              horizontalSpace(10),
              Text(employeeModel.country),
            ],
          ),
          verticalSpace(12),
        ],
      ),
    );
  }
}
