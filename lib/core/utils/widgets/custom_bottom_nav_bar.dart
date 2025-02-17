import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tradof/core/theming/app_colors.dart';

import '../../helpers/spacing.dart';
import 'bottom_nav_bar_center_icon.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    required this.onTabTapped,
    super.key,
    this.isFreelancer = false,
  });
  final void Function(int index) onTabTapped;
  final bool isFreelancer;
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 75,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(38),
                topRight: Radius.circular(38),
              ),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 8,
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SlideInLeft(
                from: 400,
                delay: const Duration(milliseconds: 250),
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
                delay: const Duration(milliseconds: 250),
                child: _buildNavItem(
                  HugeIcons.strokeRoundedSettings02,
                  4,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -20,
          child: BottomNavBarCenterIcon(
            onTap: () {
              if (currentIndex != 2) {
                setState(() {
                  currentIndex = 2;
                  widget.onTabTapped(2);
                });
              }
            },
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
        duration: const Duration(milliseconds: 300),
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
