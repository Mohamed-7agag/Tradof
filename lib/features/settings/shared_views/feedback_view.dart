import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_style.dart';
import '../../../core/utils/widgets/custom_app_bar.dart';
import '../../../core/utils/widgets/custom_button.dart';
import '../../projects/presentation/widgets/project_text_field.dart';
import '../shared_widgets/feedback_switcher_section.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Feedback',
        actionIcon: HugeIcons.strokeRoundedComment01,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20),
                  Text(
                    'What do you think of the issue search experience within Tradof projects',
                    style:
                        AppStyle.robotoRegular14.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(30),
                  const FeedbackSwitcherSection(),
                  verticalSpace(35),
                  Text(
                    'What are the main reason for your rating',
                    style: AppStyle.robotoRegular12
                        .copyWith(color: AppColors.primary),
                  ),
                  verticalSpace(10),
                  ProjectTextField(
                    labelText: '',
                    controller: TextEditingController(),
                    maxLines: 4,
                  ),
                  verticalSpace(40),
                  Text(
                    'If you have ideas to improve the experience, share with us.',
                    style: AppStyle.robotoRegular12
                        .copyWith(color: AppColors.primary),
                  ),
                  verticalSpace(10),
                  ProjectTextField(
                    labelText: '',
                    controller: TextEditingController(),
                    maxLines: 5,
                  ),
                  Expanded(child: verticalSpace(20)),
                  CustomButton(text: 'Send', onPressed: () {}),
                  verticalSpace(20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



