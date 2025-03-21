import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../offers/data/model/offer_model.dart';

class ProjectOfferItem extends StatelessWidget {
  const ProjectOfferItem({required this.offer, super.key});
  final OfferModel offer;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.projectOfferDetailsViewRoute,
          arguments: offer,
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(10),
            ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 10,
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.cardDarkColor,
                backgroundImage: offer.freelancerImageUrl.isNullOrEmpty()
                    ? null
                    : CachedNetworkImageProvider(
                        offer.freelancerImageUrl!,
                      ),
                child: offer.freelancerImageUrl.isNullOrEmpty()
                    ? const HugeIcon(
                        icon: HugeIcons.strokeRoundedUser,
                        color: AppColors.primary,
                      )
                    : null,
              ),
              title: Text(
                offer.freelancerName ?? 'Unknown',
                style: AppStyle.robotoRegular14,
              ),
            ),
            verticalSpace(8),
            Text(
              offer.proposalDescription,
              style: AppStyle.epilogueRegular14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoColumn('Price', '${offer.offerPrice}\$'),
                const SizedBox(
                  height: 35,
                  child: VerticalDivider(color: AppColors.cardDarkColor),
                ),
                _buildInfoColumn('Deadline', '${offer.days} Days'),
              ],
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyle.robotoCondensedRegular12,
        ),
        verticalSpace(6),
        Text(
          value,
          style: AppStyle.robotoRegular12.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
