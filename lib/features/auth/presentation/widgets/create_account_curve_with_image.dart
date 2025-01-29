import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/core/theming/app_style.dart';
import 'package:tradof/features/auth/presentation/widgets/account_image_widget.dart';

class CreateAccountCurveWithImage extends StatelessWidget {
  const CreateAccountCurveWithImage({super.key, required this.onImagePicked});
  final void Function(XFile? image) onImagePicked;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurveClipper(),
      child: Container(
        alignment: Alignment.center,
        height: 325.h,
        width: 1.sw,
        decoration: BoxDecoration(
          color: AppColors.background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 4),
            Text(
              'Create Account',
              style: AppStyle.poppinsBold22.copyWith(
                color: AppColors.primary,
              ),
            ),
            verticalSpace(20),
            AccountImageWidget(onImagePicked: onImagePicked),
            Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
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
