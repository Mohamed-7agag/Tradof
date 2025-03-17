import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../settings/data/model/event_model.dart';

showEventDetailDialog(BuildContext context, EventModel event) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: AppColors.primary.withValues(alpha: 0.35),
              ),
              child: Text(
                'Title',
                style: AppStyle.robotoSemiBold10.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            verticalSpace(4),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(event.title),
            ),
            verticalSpace(20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: AppColors.primary.withValues(alpha: 0.35),
              ),
              child: Text(
                'Description',
                style: AppStyle.robotoSemiBold10.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            verticalSpace(4),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(event.description),
            ),
          ],
        ),
      );
    },
  );
}
