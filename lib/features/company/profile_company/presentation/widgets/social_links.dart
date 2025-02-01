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
        Expanded(child: LinkIcon(image: 'assets/images/facebook.png')),
        horizontalSpace(8),
        Expanded(child: LinkIcon(image: 'assets/images/linkedin.png')),
        horizontalSpace(8),
        Expanded(child: LinkIcon(image: 'assets/images/google.png')),
      ],
    );
  }
}
