import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/convert_time.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../data/model/notification_model.dart';

class NotificationDetailsView extends StatelessWidget {
  const NotificationDetailsView({required this.notificationModel, super.key});
  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Notification Details',
        actionIcon: notificationIcons(notificationModel.type),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpace(16),
            SlideInRight(
              from: 400,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 18,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notificationModel.type,
                      style: AppStyle.robotoRegular14,
                    ),
                    Text(
                      convertTime(notificationModel.timestamp),
                      style: AppStyle.robotoRegular10,
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(12),
            Expanded(
              child: SlideInRight(
                from: 400,
                delay: const Duration(milliseconds: 150),
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 16,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notificationModel.message,
                        style: AppStyle.robotoRegular14,
                      ),
                      verticalSpace(6),
                      Text(
                        'Seen : ${notificationModel.seen ? 'Yes' : 'No'}',
                        style: AppStyle.robotoRegular10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
