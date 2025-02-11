import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tradof/features/freelancer/freelancer_profile/presentation/widgets/freelancer_soical_media_link_icon.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../company/company_profile/data/model/social_media_model.dart';

class FreelancerSocialMedia extends StatefulWidget {
  const FreelancerSocialMedia({super.key, required this.socialMedia});
  final List<SocialMediaModel> socialMedia;
  @override
  State<FreelancerSocialMedia> createState() => _FreelancerSocialMediaState();
}

class _FreelancerSocialMediaState extends State<FreelancerSocialMedia> {
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
            child: FreelancerSocialMediaLinkIcon(
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
            child: FreelancerSocialMediaLinkIcon(
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
            child: FreelancerSocialMediaLinkIcon(
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
            child: FreelancerSocialMediaLinkIcon(
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
