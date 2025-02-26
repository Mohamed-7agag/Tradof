import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/app_constants.dart';
import '../../data/model/company_model.dart';
import 'link_icon.dart';

class CompanySocialLinks extends StatefulWidget {
  const CompanySocialLinks({required this.companyModel, super.key});
  final CompanyModel companyModel;

  @override
  State<CompanySocialLinks> createState() => _CompanySocialLinksState();
}

class _CompanySocialLinksState extends State<CompanySocialLinks> {
  String? facebookLink, linkedinLink, githubLink, gmailLink;
  bool isForDisplay = false;

  @override
  void initState() {
    assignLinks();
    isForDisplay = widget.companyModel.id != AppConstants.kUserId;
    super.initState();
  }

  void assignLinks() {
    for (var element in widget.companyModel.socialMedia) {
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
        if (_shouldDisplayLink(gmailLink))
          _buildSocialMediaIcon(
            image: 'assets/images/gmail.png',
            link: gmailLink,
            delay: Duration.zero,
          ),
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
        child: LinkIcon(
          image: image,
          socialMedia: widget.companyModel.socialMedia,
          link: link,
          isForDisplay: isForDisplay,
        ),
      ),
    );
  }
}
