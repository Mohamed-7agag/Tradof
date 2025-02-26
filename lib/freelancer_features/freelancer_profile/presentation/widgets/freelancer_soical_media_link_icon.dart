import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/custom_url_launcher.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../company_features/company_profile/data/model/social_media_model.dart';
import '../logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';

class FreelancerSocialMediaLinkIcon extends StatelessWidget {
  const FreelancerSocialMediaLinkIcon({
    required this.image,
    required this.socialMedia,
    required this.link,
    super.key,
  });
  final String image;
  final List<SocialMediaModel> socialMedia;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        final result = await context.pushNamed(
          Routes.updateFreelancerSocialMediaViewRoute,
          arguments: socialMedia,
        );
        if (result == true && context.mounted) {
          context.read<FreelancerProfileCubit>().getFreelancerProfile();
        }
      },
      onTap: () async {
        if (link != null) {
          customUrlLauncher(context, link!);
        } else {
          final result = await context.pushNamed(
            Routes.updateFreelancerSocialMediaViewRoute,
            arguments: socialMedia,
          );
          if (result == true && context.mounted) {
            context.read<FreelancerProfileCubit>().getFreelancerProfile();
          }
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
}
