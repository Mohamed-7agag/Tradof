import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tradof/core/helpers/spacing.dart';

import '../../data/model/social_media_model.dart';
import 'link_icon.dart';

class SocialLinks extends StatefulWidget {
  const SocialLinks({super.key, required this.socialMedia});
  final List<SocialMediaModel> socialMedia;

  @override
  State<SocialLinks> createState() => _SocialLinksState();
}

class _SocialLinksState extends State<SocialLinks> {
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
            delay: Duration(milliseconds: 360),
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
            delay: Duration(milliseconds: 240),
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
            delay: Duration(milliseconds: 120),
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
