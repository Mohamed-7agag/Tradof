import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradof/core/helpers/spacing.dart';
import 'package:tradof/core/theming/app_colors.dart';

import '../../../../../core/theming/app_style.dart';
import '../../data/model/social_media_model.dart';
import '../widgets/build_add_update_social_media.dart';

class AddUpdateSocialMediaView extends StatelessWidget {
  const AddUpdateSocialMediaView({super.key, required this.socialMedia});
  final List<SocialMediaModel> socialMedia;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        leadingWidth: 40,
        title: Text('Social Media', style: AppStyle.robotoBold20),
        actions: [
          SvgPicture.asset('assets/images/edit.svg', width: 24),
          horizontalSpace(16),
        ],
      ),
      body: BuildAddUpdateSocialMedia(
        socialMedia: socialMedia,
      ),
    );
  }
}
