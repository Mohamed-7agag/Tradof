import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class FeedbackSwitcherItem extends StatelessWidget {
  const FeedbackSwitcherItem({
    required this.index,
    required this.isSelected,
    super.key,
  });
  final int index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              color: getFeedbackColor(index),
            ),
            child: Row(
              children: [
                horizontalSpace(8),
                Icon(
                  getFeedbackIcon(index),
                  color: AppColors.white,
                  size: 22,
                ),
                horizontalSpace(6),
                Text(
                  getFeedbackName(index),
                  style: AppStyle.robotoRegular12.copyWith(
                    color: AppColors.white,
                  ),
                ),
                horizontalSpace(14),
              ],
            ),
          )
        : Icon(
            getFeedbackIcon(index),
            color: Colors.grey,
            size: 25,
          );
  }

  Color getFeedbackColor(int status) {
    switch (status) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.pink;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.green;
      case 4:
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  String getFeedbackName(int status) {
    switch (status) {
      case 0:
        return 'Angry';
      case 1:
        return 'Sad';
      case 2:
        return 'Okey';
      case 3:
        return 'Good';
      case 4:
        return 'Amazing';
      default:
        return '';
    }
  }

  IconData getFeedbackIcon(int status) {
    switch (index) {
      case 0:
        return Icons.sentiment_very_dissatisfied;
      case 1:
        return Icons.sentiment_dissatisfied;
      case 2:
        return Icons.sentiment_neutral;
      case 3:
        return Icons.sentiment_satisfied;
      case 4:
        return Icons.sentiment_very_satisfied;
      default:
        return Icons.sentiment_very_dissatisfied;
    }
  }
}
