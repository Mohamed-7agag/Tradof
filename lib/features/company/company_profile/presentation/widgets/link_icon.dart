import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/theming/app_colors.dart';
import 'package:tradof/features/company/company_profile/presentation/logic/company_profile_cubit/company_profile_cubit.dart';
import 'package:tradof/features/company/company_profile/data/model/social_media_model.dart';

import '../../../../../core/helpers/custom_url_launcher.dart';

class LinkIcon extends StatelessWidget {
  const LinkIcon({
    super.key,
    required this.image,
    required this.socialMedia,
    required this.link,
  });
  final String image;
  final List<SocialMediaModel> socialMedia;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        final result = await context.pushNamed(
          Routes.addUpdateSocialMediaViewRoute,
          extra: socialMedia,
        );
        if (result == true && context.mounted) {
          context.read<CompanyProfileCubit>().getCompanyProfile();
        }
      },
      onTap: () async {
        if (link != null) {
          customUrlLauncher(context, link!);
        } else {
          final result = await context.pushNamed(
            Routes.addUpdateSocialMediaViewRoute,
            extra: socialMedia,
          );
          if (result == true && context.mounted) {
            context.read<CompanyProfileCubit>().getCompanyProfile();
          }
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          image,
          height: 32,
        ),
      ),
    );
  }
}
