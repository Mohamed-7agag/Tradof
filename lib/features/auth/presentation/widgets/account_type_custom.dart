import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';

class AccountTypeCustom extends StatelessWidget {
  const AccountTypeCustom({
    required this.image,
    required this.title,
    required this.description,
    required this.onTap,
    super.key,
  });
  final String image;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      isThreeLine: true,
      leading: SvgPicture.asset(image),
      title: Text(
        title,
        style: AppStyle.poppinsSemiBold14,
      ),
      subtitle: Text(
        description,
        maxLines: 6,
        overflow: TextOverflow.fade,
        style: AppStyle.epilogueRegular14.copyWith(color: AppColors.darkGrey),
      ),
    );
  }
}
