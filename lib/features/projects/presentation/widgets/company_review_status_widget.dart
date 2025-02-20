import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_button.dart';

class CompanyReviewStatusWidget extends StatelessWidget {
  const CompanyReviewStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(30),
                Text('Uploaded Files', style: AppStyle.poppinsMedium14),
                verticalSpace(12),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.grey)),
                ),
                Expanded(child: verticalSpace(20)),
                Align(
                  child: CustomButton(
                    text: 'Finish',
                    color: AppColors.lightOrange,
                    width: 0.6,
                    onPressed: () {},
                  ),
                ),
                verticalSpace(20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
