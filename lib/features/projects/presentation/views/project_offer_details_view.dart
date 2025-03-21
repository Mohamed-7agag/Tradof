import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../offers/data/model/offer_model.dart';
import '../widgets/download_attachment_files_section.dart';

class ProjectOfferDetailsView extends StatelessWidget {
  const ProjectOfferDetailsView({required this.offer, super.key});
  final OfferModel offer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Offer Details',
        actionIcon: HugeIcons.strokeRoundedClipboard,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      color: AppColors.cardColor,
                    ),
                    child: ListTile(
                      horizontalTitleGap: 10,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 14,
                      ),
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.cardDarkColor,
                        backgroundImage:
                            offer.freelancerImageUrl.isNullOrEmpty()
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
                      trailing: IconButton(
                          onPressed: () {
                            context.pushNamed(
                              Routes.freelancerProfileDisplayViewRoute,
                              arguments: offer.freelancerId,
                            );
                          },
                          icon: const HugeIcon(
                            icon: HugeIcons.strokeRoundedSquareArrowUpRight,
                            color: AppColors.primary,
                            size: 26,
                          )),
                    ),
                  ),
                  verticalSpace(20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    width: 1.sw,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      color: AppColors.cardColor,
                    ),
                    child: Text(
                      offer.proposalDescription,
                      style: AppStyle.epilogueRegular14,
                    ),
                  ),
                  verticalSpace(20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      color: AppColors.cardColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildInfoColumn('Price', '${offer.offerPrice}\$'),
                        const SizedBox(
                          height: 35,
                          child: VerticalDivider(
                            color: AppColors.cardDarkColor,
                          ),
                        ),
                        _buildInfoColumn('Deadline', '${offer.days} Days'),
                      ],
                    ),
                  ),
                  verticalSpace(20),
                  if (offer.proposalAttachments.isNotEmpty)
                    const DownloadAttachmentFilesSection(files: []),
                  Expanded(child: verticalSpace(20)),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Deny',
                          onPressed: () {},
                          color: Colors.red,
                        ),
                      ),
                      horizontalSpace(10),
                      Expanded(
                        child: CustomButton(
                          text: 'Accept',
                          onPressed: () {},
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        ],
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
