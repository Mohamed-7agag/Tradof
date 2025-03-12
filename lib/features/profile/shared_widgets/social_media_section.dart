import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../company_profile/data/model/social_media_model.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/utils/app_constants.dart';
import 'soical_media_item.dart';

class SocialMediaSection extends StatefulWidget {
  const SocialMediaSection({
    required this.userId,
    required this.socialMedia,
    required this.isFreeLancer,
    super.key,
  });
  final String userId;
  final List<SocialMediaModel> socialMedia;
  final bool isFreeLancer;
  @override
  State<SocialMediaSection> createState() => _SocialMediaSectionState();
}

class _SocialMediaSectionState extends State<SocialMediaSection> {
  String? facebookLink, linkedinLink, githubLink, gmailLink;
  bool isForDisplay = false;

  @override
  void initState() {
    assignLinks();
    isForDisplay = widget.userId != AppConstants.kUserId;
    super.initState();
  }

  void assignLinks() {
    for (var element in widget.socialMedia) {
      switch (element.platformType) {
        case 'Facebook':
          facebookLink = element.link;
          break;
        case 'LinkedIn':
          linkedinLink = element.link;
          break;
        case 'Gmail':
          gmailLink = element.link;
          break;
        case 'GitHub':
          githubLink = element.link;
          break;
      }
    }
  }

  bool _shouldDisplayLink(String? link) {
    return (isForDisplay && link != null) || !isForDisplay;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (_shouldDisplayLink(facebookLink)) ...[
          _buildSocialMediaIcon(
            image: 'assets/images/facebook.png',
            link: facebookLink,
            delay: const Duration(milliseconds: 240),
          ),
          horizontalSpace(8),
        ],
        if (_shouldDisplayLink(linkedinLink)) ...[
          _buildSocialMediaIcon(
            image: 'assets/images/linkedin.png',
            link: linkedinLink,
            delay: const Duration(milliseconds: 160),
          ),
          horizontalSpace(8),
        ],
        if (_shouldDisplayLink(githubLink)) ...[
          _buildSocialMediaIcon(
            image: 'assets/images/github.png',
            link: githubLink,
            delay: const Duration(milliseconds: 80),
          ),
          horizontalSpace(8),
        ],
        if (_shouldDisplayLink(gmailLink)) ...[
          _buildSocialMediaIcon(
            image: 'assets/images/gmail.png',
            link: gmailLink,
            delay: Duration.zero,
          ),
        ],
      ],
    );
  }

  Widget _buildSocialMediaIcon({
    required String image,
    required String? link,
    required Duration delay,
  }) {
    return Expanded(
      child: FadeInLeft(
        from: 400,
        delay: delay,
        child: SocialMediaItem(
          image: image,
          socialMedia: widget.socialMedia,
          link: link,
          isForDisplay: isForDisplay,
          isFreelancer: widget.isFreeLancer,
        ),
      ),
    );
  }
}
