import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/custom_url_launcher.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../data/models/file_model.dart';

class DownloadAttachmentFilesSection extends StatelessWidget {
  const DownloadAttachmentFilesSection({required this.files, super.key});
  final List<FileModel> files;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        color: AppColors.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(12),
          Text(
            'Project Files',
            style: AppStyle.robotoCondensedRegular15,
          ),
          verticalSpace(6),
          Column(
            children: files.map((file) {
              return GestureDetector(
                onTap: () async {
                  customUrlLauncher(context, file.filePath);
                  log(file.filePath);
                },
                child: ListTile(
                  horizontalTitleGap: 10,
                  contentPadding: EdgeInsets.zero,
                  title: Text(file.fileName, style: AppStyle.robotoRegular14),
                  leading: const HugeIcon(
                    icon: HugeIcons.strokeRoundedFile02,
                    color: AppColors.black,
                  ),
                  trailing: Text(
                    '${(file.fileSize / (1024 * 1024)).toStringAsFixed(2)} MB',
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
