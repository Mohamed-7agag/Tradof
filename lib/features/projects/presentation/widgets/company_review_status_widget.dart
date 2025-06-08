import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/custom_url_launcher.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../data/models/project_model.dart';
import 'bloc_builder_mark_as_finish_button.dart';

class CompanyReviewStatusWidget extends StatelessWidget {
  const CompanyReviewStatusWidget({required this.projectModel, super.key});

  final ProjectModel projectModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(30),
                Text('Uploaded Files', style: AppStyle.poppinsMedium14),
                verticalSpace(12),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    border: Border.all(color: AppColors.grey),
                  ),
                  child: Column(
                    children: projectModel.files.asMap().entries.map((entry) {
                      final index = entry.key;
                      final file = entry.value;
                      return ListTile(
                        contentPadding: EdgeInsets.only(
                          left: 10.w,
                          bottom:
                              index == projectModel.files.length - 1 ? 20 : 0,
                        ),
                        title: Text(file.fileName),
                        leading: const Icon(Icons.file_copy),
                        onTap: () => customUrlLauncher(context, file.filePath),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(child: verticalSpace(20)),
                Align(
                  child:
                      BlocBuilderMarkAsFinishButton(projectModel: projectModel),
                ),
                verticalSpace(20),
              ],
            ),
          )
        ],
      ),
    );
  }
}

