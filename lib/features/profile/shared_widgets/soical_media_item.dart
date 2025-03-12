import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../company_profile/data/model/social_media_model.dart';
import '../company_profile/presentation/logic/company_profile_cubit/company_profile_cubit.dart';
import '../../../core/helpers/custom_url_launcher.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/app_colors.dart';
import '../freelancer_profile/presentation/logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem({
    required this.image,
    required this.socialMedia,
    required this.link,
    required this.isForDisplay,
    required this.isFreelancer,
    super.key,
  });
  final String image;
  final List<SocialMediaModel> socialMedia;
  final String? link;
  final bool isForDisplay;
  final bool? isFreelancer;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        if (isForDisplay) return;
        await _handleLinkPress(context);
      },
      onTap: () async {
        if (link != null) {
          customUrlLauncher(context, link!);
        } else {
          if (isForDisplay) return;
          await _handleLinkPress(context);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Image.asset(image, height: 32),
      ),
    );
  }

  Future<void> _handleLinkPress(BuildContext context) async {
    final result = await context.pushNamed(
      Routes.updateSocialMediaViewRoute,
      arguments: {
        'socialMedia': socialMedia,
        'isFreelancer': isFreelancer,
      },
    );
    if (result == true && context.mounted) {
      if (isFreelancer == true) {
        context.read<FreelancerProfileCubit>().getFreelancerProfile();
      } else {
        context.read<CompanyProfileCubit>().getCompanyProfile();
      }
    }
  }
}
