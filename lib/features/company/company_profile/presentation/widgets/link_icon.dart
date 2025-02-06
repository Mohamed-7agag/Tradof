import 'package:flutter/material.dart';
import 'package:tradof/core/theming/app_colors.dart';

class LinkIcon extends StatelessWidget {
  const LinkIcon({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(
        image,
        height: 32,
      ),
    );
  }
}
