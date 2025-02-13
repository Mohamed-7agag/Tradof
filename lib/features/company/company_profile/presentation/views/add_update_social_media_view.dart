import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../data/model/social_media_model.dart';
import '../widgets/build_add_update_social_media.dart';

class AddUpdateSocialMediaView extends StatelessWidget {
  const AddUpdateSocialMediaView({super.key, required this.socialMedia});
  final List<SocialMediaModel> socialMedia;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Social Media',
        actionIcon: SvgPicture.asset('assets/images/edit.svg', width: 24),
      ),
      body: BuildAddUpdateSocialMedia(socialMedia: socialMedia),
    );
  }
}
