import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';

class CreateOfferAppbar extends StatelessWidget {
  const CreateOfferAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      title: Text(
        'Add Offer',
        style: AppStyle.robotoBold20.copyWith(color: AppColors.primary),
      ),
      actions: [
        SvgPicture.asset('assets/images/pen_add_colored.svg', width: 24),
        horizontalSpace(16),
      ],
      toolbarHeight: 65,
    );
  }
}
