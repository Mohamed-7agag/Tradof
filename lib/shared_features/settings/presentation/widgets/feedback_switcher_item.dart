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

  static const Map<int, Color> _feedbackColors = {
    0: Colors.red,
    1: Colors.pink,
    2: Colors.blue,
    3: Colors.green,
    4: Colors.orange,
  };

  static const Map<int, String> _feedbackNames = {
    0: 'Angry',
    1: 'Sad',
    2: 'Okey',
    3: 'Good',
    4: 'Amazing',
  };

  static const Map<int, IconData> _feedbackIcons = {
    0: Icons.sentiment_very_dissatisfied,
    1: Icons.sentiment_dissatisfied,
    2: Icons.sentiment_neutral,
    3: Icons.sentiment_satisfied,
    4: Icons.sentiment_very_satisfied,
  };

  @override
  Widget build(BuildContext context) {
    return isSelected ? _buildSelectedItem() : _buildUnselectedItem();
  }

  Widget _buildSelectedItem() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 14, top: 7, bottom: 7),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: _feedbackColors[index],
      ),
      child: Row(
        children: [
          Icon(
            _feedbackIcons[index],
            color: AppColors.white,
            size: 22,
          ),
          horizontalSpace(6),
          Text(
            _feedbackNames[index]!,
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
      _feedbackIcons[index],
      color: Colors.grey,
      size: 25,
    );
  }
}
