import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tradof/core/helpers/spacing.dart';

import 'link_icon.dart';

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
            delay: Duration(milliseconds: 360),
            child: LinkIcon(image: 'assets/images/facebook.png'),
          ),
        ),
        horizontalSpace(8),
        Expanded(
          child: FadeInLeft(
            from: 400,
            delay: Duration(milliseconds: 240),
            child: LinkIcon(image: 'assets/images/linkedin.png'),
          ),
        ),
        horizontalSpace(8),
        Expanded(
          child: FadeInLeft(
            from: 400,
            delay: Duration(milliseconds: 120),
            child: LinkIcon(image: 'assets/images/github.png'),
          ),
        ),
        horizontalSpace(8),
        Expanded(
          child: FadeInLeft(
            from: 400,
            child: LinkIcon(image: 'assets/images/gmail.png'),
          ),
        ),
      ],
    );
  }
}
