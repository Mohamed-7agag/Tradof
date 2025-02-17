import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../data/model/social_media_model.dart';
import '../widgets/build_add_update_social_media.dart';

class AddUpdateSocialMediaView extends StatelessWidget {
  const AddUpdateSocialMediaView({required this.socialMedia, super.key});
  final List<SocialMediaModel> socialMedia;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Social Media',
        actionIcon: HugeIcons.strokeRoundedPencilEdit02,
      ),
      body: BuildAddUpdateSocialMedia(socialMedia: socialMedia),
    );
  }
}
