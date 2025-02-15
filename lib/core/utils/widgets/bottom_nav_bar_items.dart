import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tradof/core/theming/app_colors.dart';

import '../../helpers/spacing.dart';

class BottomNavBarItems extends StatefulWidget {
  const BottomNavBarItems({
    super.key,
    required this.onTabTapped,
    this.isFreelancer = false,
  });
  final void Function(int index) onTabTapped;
  final bool isFreelancer;
  @override
  State<BottomNavBarItems> createState() => _BottomNavBarItemsState();
}

class _BottomNavBarItemsState extends State<BottomNavBarItems> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SlideInLeft(
          from: 400,
          delay: Duration(milliseconds: 250),
          child: _buildNavItem(
            HugeIcons.strokeRoundedHome04,
            0,
          ),
        ),
        SlideInLeft(
          from: 400,
          child: _buildNavItem(
            widget.isFreelancer
                ? HugeIcons.strokeRoundedClipboard
                : HugeIcons.strokeRoundedResourcesAdd,
            1,
          ),
        ),
        horizontalSpace(45),
        SlideInRight(
          from: 400,
          child: _buildNavItem(
            HugeIcons.strokeRoundedCreditCardPos,
            3,
          ),
        ),
        SlideInRight(
          from: 400,
          delay: Duration(milliseconds: 250),
          child: _buildNavItem(
            HugeIcons.strokeRoundedSettings02,
            4,
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = currentIndex == index;
    return IconButton(
      onPressed: () {
        if (currentIndex != index) {
          setState(() {
            currentIndex = index;
            widget.onTabTapped(index);
          });
        }
      },
      style: IconButton.styleFrom(
        backgroundColor:
            isSelected ? AppColors.primary.withValues(alpha: 0.2) : null,
      ),
      icon: AnimatedPadding(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: isSelected ? 18 : 0),
        child: HugeIcon(
          icon: icon,
          color: isSelected ? AppColors.primary : Colors.grey[400]!,
          size: isSelected ? 25 : 27,
        ),
      ),
    );
  }
}
