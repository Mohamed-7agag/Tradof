import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/custom_url_launcher.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../data/model/social_media_model.dart';
import '../logic/company_profile_cubit/company_profile_cubit.dart';

class CompanySocialMediaLinkIcon extends StatelessWidget {
  const CompanySocialMediaLinkIcon({
    required this.image,
    required this.socialMedia,
    required this.link,
    required this.isForDisplay,
    super.key,
  });
  final String image;
  final List<SocialMediaModel> socialMedia;
  final String? link;
  final bool isForDisplay;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        if (isForDisplay) return;
        final result = await context.pushNamed(
          Routes.updateSocialMediaViewRoute,
          arguments: {
            'socialMedia': socialMedia,
            'isFreelancer': false,
          },
        );
        if (result == true && context.mounted) {
          context.read<CompanyProfileCubit>().getCompanyProfile();
        }
      },
      onTap: () async {
        if (link != null) {
          customUrlLauncher(context, link!);
        } else {
          if (isForDisplay) return;
          final result = await context.pushNamed(
            Routes.updateSocialMediaViewRoute,
            arguments: {
              'socialMedia': socialMedia,
              'isFreelancer': false,
            },
          );
          if (result == true && context.mounted) {
            context.read<CompanyProfileCubit>().getCompanyProfile();
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Image.asset(
          image,
          height: 32,
        ),
      ),
    );
  }
}
