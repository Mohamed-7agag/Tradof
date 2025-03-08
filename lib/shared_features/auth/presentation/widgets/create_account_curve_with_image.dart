import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import 'account_image_widget.dart';

class CreateAccountCurveWithImage extends StatelessWidget {
  const CreateAccountCurveWithImage({super.key});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurveClipper(),
      child: Container(
        alignment: Alignment.center,
        height: 290.h,
        width: 1.sw,
        decoration: const BoxDecoration(
          color: AppColors.background,
        ),
        child: Column(
          children: [
            const Spacer(flex: 4),
            Text(
              'Create Account',
              style: AppStyle.poppinsBold22.copyWith(
                color: AppColors.primary,
              ),
            ),
            verticalSpace(20),
            const AccountImageWidget(),
            const Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
