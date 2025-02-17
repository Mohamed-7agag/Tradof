import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../data/model/social_media_model.dart';
import 'add_update_social_media_button.dart';
import 'social_media_item.dart';

class BuildAddUpdateSocialMedia extends StatefulWidget {
  const BuildAddUpdateSocialMedia({
    required this.socialMedia,
    super.key,
  });
  final List<SocialMediaModel> socialMedia;

  @override
  State<BuildAddUpdateSocialMedia> createState() =>
      _BuildAddUpdateSocialMediaState();
}

class _BuildAddUpdateSocialMediaState extends State<BuildAddUpdateSocialMedia> {
  late TextEditingController facebookController;
  late TextEditingController linkedinController;
  late TextEditingController gmailController;
  late TextEditingController githubController;
  @override
  void initState() {
    facebookController = TextEditingController();
    linkedinController = TextEditingController();
    gmailController = TextEditingController();
    githubController = TextEditingController();
    for (var element in widget.socialMedia) {
      if (element.platformType == 'Facebook') {
        facebookController.text = element.link;
      } else if (element.platformType == 'LinkedIn') {
        linkedinController.text = element.link;
      } else if (element.platformType == 'Gmail') {
        gmailController.text = element.link;
      } else if (element.platformType == 'GitHub') {
        githubController.text = element.link;
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    facebookController.dispose();
    linkedinController.dispose();
    gmailController.dispose();
    githubController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                verticalSpace(28),
                SlideInRight(
                  from: 400,
                  child: SocialMediaItem(
                    image: 'assets/images/facebook.png',
                    controller: facebookController,
                  ),
                ),
                verticalSpace(28),
                SlideInRight(
                  from: 400,
                  delay: const Duration(milliseconds: 100),
                  child: SocialMediaItem(
                    image: 'assets/images/linkedin.png',
                    controller: linkedinController,
                  ),
                ),
                verticalSpace(28),
                SlideInRight(
                  from: 400,
                  delay: const Duration(milliseconds: 200),
                  child: SocialMediaItem(
                    image: 'assets/images/github.png',
                    controller: githubController,
                  ),
                ),
                verticalSpace(28),
                SlideInRight(
                  from: 400,
                  delay: const Duration(milliseconds: 300),
                  child: SocialMediaItem(
                    image: 'assets/images/gmail.png',
                    controller: gmailController,
                  ),
                ),
                Expanded(child: verticalSpace(40)),
                SlideInUp(
                  from: 400,
                  delay: const Duration(milliseconds: 400),
                  child: AddUpdateSocialMediaButton(
                    facebookController: facebookController,
                    linkedinController: linkedinController,
                    gmailController: gmailController,
                    githubController: githubController,
                  ),
                ),
                verticalSpace(20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
