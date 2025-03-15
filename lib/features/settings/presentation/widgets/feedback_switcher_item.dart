import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class FeedbackSwitcherItem extends StatelessWidget {
  const FeedbackSwitcherItem({
    required this.isSelected,
    required this.selectedColor,
    required this.feedbackName,
    required this.feedbackIcon,
    super.key,
  });

  final bool isSelected;
  final Color selectedColor;
  final String feedbackName;
  final IconData feedbackIcon;

  @override
  Widget build(BuildContext context) {
    return isSelected ? _buildSelectedItem() : _buildUnselectedItem();
  }

  Widget _buildSelectedItem() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 14, top: 7, bottom: 7),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: selectedColor,
      ),
      child: Row(
        children: [
          Icon(
            feedbackIcon,
            color: AppColors.white,
            size: 22,
          ),
          horizontalSpace(6),
          Text(
            feedbackName,
            style: AppStyle.robotoRegular12.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnselectedItem() {
    return Icon(
      feedbackIcon,
      color: Colors.grey,
      size: 25,
    );
  }
}
