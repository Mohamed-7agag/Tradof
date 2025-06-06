import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/convert_time.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/app_constants.dart';
import '../../data/model/notification_model.dart';
import '../logic/cubit/notification_cubit.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({required this.notification, super.key});
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return SlideInRight(
      child: InkWell(
        onTap: () {
          context.read<NotificationCubit>().markAsSeen(notification.id);
          Navigator.pushNamed(
            context,
            Routes.notificationDetailsViewRoute,
            arguments: notification,
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: AppColors.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 10,
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 17,
                  child: HugeIcon(
                    icon: notificationIcons(notification.type),
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
                title: Text(
                  notification.type,
                  style: AppStyle.poppinsMedium14,
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      convertTime(notification.timestamp),
                      style: AppStyle.robotoRegular10,
                    ),
                    if(!notification.seen) const Icon(
                      Icons.circle,
                      size: 8,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
              Text(
                notification.message,
                style: AppStyle.robotoRegular12,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpace(10)
            ],
          ),
        ),
      ),
    );
  }
}
