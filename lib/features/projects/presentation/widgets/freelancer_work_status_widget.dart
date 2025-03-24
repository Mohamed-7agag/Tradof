import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../logic/file_cubit.dart';
import 'attachment_files_section.dart';

class FreelancerWorkStatusWidget extends StatelessWidget {
  const FreelancerWorkStatusWidget({super.key});

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
                Text('Upload Files', style: AppStyle.poppinsMedium14),
                verticalSpace(12),
                BlocProvider(
                  create: (context) => FileCubit(),
                  child: const AttachmentFilesSection(),
                ),
                Expanded(child: verticalSpace(40)),
                const Align(
                  child: FreelancerWorkStatusButton(),
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

class FreelancerWorkStatusButton extends StatelessWidget {
  const FreelancerWorkStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Review Request',
      color: AppColors.lightOrange,
      width: 0.6,
      onPressed: () {},
    );
  }
}
