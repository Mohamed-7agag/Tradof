import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/utils/widgets/custom_app_bar.dart';
import '../company_profile/data/model/social_media_model.dart';
import '../shared_widgets/update_company_social_media_button.dart';
import '../shared_widgets/update_freelancer_social_media_button.dart';
import '../shared_widgets/update_social_media_item.dart';

class UpdateSocialMediaView extends StatefulWidget {
  const UpdateSocialMediaView({
    required this.socialList,
    required this.isFreelancer,
    super.key,
  });
  final List<SocialMediaModel> socialList;
  final bool isFreelancer;
  @override
  State<UpdateSocialMediaView> createState() => _UpdateSocialMediaViewState();
}

class _UpdateSocialMediaViewState extends State<UpdateSocialMediaView> {
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
    for (var element in widget.socialList) {
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
    return Scaffold(
      appBar: customAppbar(
        title: 'Social Media',
        actionIcon: HugeIcons.strokeRoundedPencilEdit02,
      ),
      body: Padding(
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
                    child: UpdateSocialMediaItem(
                      image: 'assets/images/facebook.png',
                      controller: facebookController,
                    ),
                  ),
                  verticalSpace(28),
                  SlideInRight(
                    from: 400,
                    delay: const Duration(milliseconds: 100),
                    child: UpdateSocialMediaItem(
                      image: 'assets/images/linkedin.png',
                      controller: linkedinController,
                    ),
                  ),
                  verticalSpace(28),
                  SlideInRight(
                    from: 400,
                    delay: const Duration(milliseconds: 200),
                    child: UpdateSocialMediaItem(
                      image: 'assets/images/github.png',
                      controller: githubController,
                    ),
                  ),
                  verticalSpace(28),
                  SlideInRight(
                    from: 400,
                    delay: const Duration(milliseconds: 300),
                    child: UpdateSocialMediaItem(
                      image: 'assets/images/gmail.png',
                      controller: gmailController,
                    ),
                  ),
                  Expanded(child: verticalSpace(40)),
                  SlideInUp(
                    from: 400,
                    delay: const Duration(milliseconds: 400),
                    child: widget.isFreelancer
                        ? UpdateFreelancerSocialMediaButton(
                            facebookController: facebookController,
                            linkedinController: linkedinController,
                            gmailController: gmailController,
                            githubController: githubController,
                          )
                        : UpdateCompanySocialMediaButton(
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
      ),
    );
  }
}
