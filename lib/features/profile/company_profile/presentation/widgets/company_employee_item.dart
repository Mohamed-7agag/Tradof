import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_style.dart';
import '../../data/model/company_employee_model.dart';

class CompanyEmployeeItem extends StatelessWidget {
  const CompanyEmployeeItem({required this.employeeModel, super.key});
  final CompanyEmployeeModel employeeModel;

  Widget _buildInfoContainer({
    required IconData icon,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.cardDarkColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          HugeIcon(
            icon: icon,
            color: AppColors.primary,
            size: 21,
          ),
          horizontalSpace(10),
          Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      from: 400,
      child: Container(
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
            _buildInfoContainer(
              icon: HugeIcons.strokeRoundedJobLink,
              text: employeeModel.jobTitle,
            ),
            verticalSpace(10),
            _buildInfoContainer(
              icon: HugeIcons.strokeRoundedCall,
              text: employeeModel.phoneNumber,
            ),
            verticalSpace(10),
            _buildInfoContainer(
              icon: HugeIcons.strokeRoundedUserMultiple,
              text: employeeModel.groupName,
            ),
            verticalSpace(10),
            _buildInfoContainer(
              icon: HugeIcons.strokeRoundedCity01,
              text: employeeModel.country,
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
