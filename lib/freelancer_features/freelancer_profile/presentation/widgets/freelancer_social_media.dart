import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/app_constants.dart';
import '../../data/model/freelancer_model.dart';
import 'freelancer_soical_media_link_icon.dart';

class FreelancerSocialMedia extends StatefulWidget {
  const FreelancerSocialMedia({required this.freelancerModel, super.key});
  final FreelancerModel freelancerModel;

  @override
  State<FreelancerSocialMedia> createState() => _FreelancerSocialMediaState();
}

class _FreelancerSocialMediaState extends State<FreelancerSocialMedia> {
  String? facebookLink, linkedinLink, githubLink, gmailLink;
  bool isForDisplay = false;

  @override
  void initState() {
    assignLinks();
    isForDisplay = widget.freelancerModel.userId != AppConstants.kUserId;
    super.initState();
  }

  void assignLinks() {
    for (var element in widget.freelancerModel.socialMedias) {
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
        child: FreelancerSocialMediaLinkIcon(
          image: image,
          socialMedia: widget.freelancerModel.socialMedias,
          link: link,
          isForDisplay: isForDisplay,
        ),
      ),
    );
  }
}
