import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../data/model/social_media_model.dart';
import 'link_icon.dart';

class CompanySocialLinks extends StatefulWidget {
  const CompanySocialLinks({required this.socialMedia, super.key});
  final List<SocialMediaModel> socialMedia;

  @override
  State<CompanySocialLinks> createState() => _CompanySocialLinksState();
}

class _CompanySocialLinksState extends State<CompanySocialLinks> {
  String? facebookLink, linkedinLink, githubLink, gmailLink;
  @override
  void initState() {
    assignLinks();
    super.initState();
  }

  void assignLinks() {
    for (var element in widget.socialMedia) {
      if (element.platformType == 'Facebook') {
        facebookLink = element.link;
      } else if (element.platformType == 'LinkedIn') {
        linkedinLink = element.link;
      } else if (element.platformType == 'Gmail') {
        gmailLink = element.link;
      } else if (element.platformType == 'GitHub') {
        githubLink = element.link;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: FadeInLeft(
            from: 400,
            delay: const Duration(milliseconds: 240),
            child: LinkIcon(
              image: 'assets/images/facebook.png',
              socialMedia: widget.socialMedia,
              link: facebookLink,
            ),
          ),
        ),
        horizontalSpace(8),
        Expanded(
          child: FadeInLeft(
            from: 400,
            delay: const Duration(milliseconds: 160),
            child: LinkIcon(
              image: 'assets/images/linkedin.png',
              socialMedia: widget.socialMedia,
              link: linkedinLink,
            ),
          ),
        ),
        horizontalSpace(8),
        Expanded(
          child: FadeInLeft(
            from: 400,
            delay: const Duration(milliseconds: 80),
            child: LinkIcon(
              image: 'assets/images/github.png',
              socialMedia: widget.socialMedia,
              link: githubLink,
            ),
          ),
        ),
        horizontalSpace(8),
        Expanded(
          child: FadeInLeft(
            from: 400,
            child: LinkIcon(
              image: 'assets/images/gmail.png',
              socialMedia: widget.socialMedia,
              link: gmailLink,
            ),
          ),
        ),
      ],
    );
  }
}
