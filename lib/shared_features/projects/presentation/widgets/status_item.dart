import 'package:flutter/material.dart';
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

  static const Map<int, Color> _statusColors = {
    0: Colors.green,
    1: Colors.blue,
    2: Colors.orange,
  };

  static const Map<int, String> _statusNames = {
    0: 'Work',
    1: 'Review',
    2: 'Finished',
  };

  static const Map<int, IconData> _statusIcons = {
    0: HugeIcons.strokeRoundedTranslate,
    1: HugeIcons.strokeRoundedTimer02,
    2: HugeIcons.strokeRoundedCheckList,
  };

  @override
  Widget build(BuildContext context) {
    return status == index ? _buildSelectedItem() : _buildUnselectedItem();
  }

  Widget _buildSelectedItem() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: _statusColors[index],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HugeIcon(
            icon: _statusIcons[index]!,
            color: AppColors.white,
            size: 20,
          ),
          horizontalSpace(8),
          Text(
            _statusNames[index]!,
            style: AppStyle.robotoRegular14.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnselectedItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: HugeIcon(
        icon: _statusIcons[index]!,
        color: Colors.grey,
        size: 20,
      ),
    );
  }
}
