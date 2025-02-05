import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/features/company/profile_company/presentation/widgets/link_icon.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key, required this.socialLinks});
  final List<dynamic> socialLinks;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: FadeInLeft(
            from: 400,
            delay: Duration(milliseconds: 320),
            child: LinkIcon(image: 'assets/images/facebook.png'),
          ),
        ),
        horizontalSpace(8),
        Expanded(
          child: FadeInLeft(
            from: 400,
            delay: Duration(milliseconds: 160),
            child: LinkIcon(image: 'assets/images/linkedin.png')),
        ),
        horizontalSpace(8),
        Expanded(
          child: FadeInLeft(
            from: 400,
            child: LinkIcon(image: 'assets/images/google.png')),
        ),
      ],
    );
  }
}
