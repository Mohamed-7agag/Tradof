import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../data/model/offer_model.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({
    required this.offer,
    required this.onTap,
    super.key,
  });

  final OfferModel offer;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      onTap: onTap,
      child: SlideInLeft(
        from: 400,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: AppColors.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Project',
                    style: AppStyle.robotoCondensedRegular12.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedSquareArrowUpRight,
                    color: AppColors.primary,
                  )
                ],
              ),
              verticalSpace(8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: const BoxDecoration(
                  color: AppColors.cardDarkColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Text(
                  offer.projecttitle,
                  style: AppStyle.robotoRegular12.copyWith(
                    color: AppColors.black,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              verticalSpace(12),
              Text(
                'Offer',
                style: AppStyle.robotoCondensedRegular12.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalSpace(6),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: const BoxDecoration(
                  color: AppColors.cardDarkColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Text(
                  offer.proposalDescription,
                  style: AppStyle.robotoRegular12.copyWith(
                    color: AppColors.black,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildInfoColumn('Delivery Time', '${offer.days} Days'),
                  const SizedBox(
                    height: 35,
                    child: VerticalDivider(color: AppColors.cardDarkColor),
                  ),
                  _buildInfoColumn('Price', '${offer.offerPrice} EGP'),
                  const SizedBox(
                    height: 35,
                    child: VerticalDivider(color: AppColors.cardDarkColor),
                  ),
                  _buildStatusWidget('Status', status(offer.proposalStatus)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  StatusClass status(int status) {
    switch (status) {
      case 0:
        return StatusClass(
            status: status,
            value: 'Pending',
            color: const Color(0xffA20000),
            backgroundColor: const Color(0xffFFC3C3));
      case 1:
        return StatusClass(
            status: status,
            value: 'Accepted',
            color: const Color(0xff44AA44),
            backgroundColor: const Color(0xffA9FFA9));
      case 2:
        return StatusClass(
            status: status,
            value: 'Declined',
            color: AppColors.primary,
            backgroundColor: AppColors.primary.withValues(alpha: 0.15));
      case 3:
        return StatusClass(
            status: status,
            value: 'Canceled',
            color: const Color(0xffFFFFFF),
            backgroundColor: const Color(0xff8E8E93));
      default:
        return StatusClass(
            status: status,
            value: 'Unknown',
            color: AppColors.primary,
            backgroundColor: AppColors.primary.withValues(alpha: 0.15));
    }
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

  Widget _buildStatusWidget(String title, StatusClass status) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyle.robotoCondensedRegular12,
        ),
        verticalSpace(6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: status.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Text(
            status.value,
            style: AppStyle.robotoRegular8.copyWith(
              color: status.color,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

class StatusClass {
  int status;
  String value;
  Color color;
  Color backgroundColor;
  StatusClass(
      {required this.status,
      required this.value,
      required this.color,
      required this.backgroundColor});
}
