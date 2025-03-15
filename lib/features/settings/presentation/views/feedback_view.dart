import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../projects/presentation/widgets/project_text_field.dart';
import '../widgets/feedback_button.dart';
import '../widgets/feedback_switcher_section.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({super.key});

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                  verticalSpace(30),
                  Text(
                    'What do you think of the issue search experience within Tradof projects',
                    style:
                        AppStyle.robotoRegular14.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(50),
                  const FeedbackSwitcherSection(),
                  verticalSpace(50),
                  Text(
                    'What are the main reason for your rating',
                    style: AppStyle.robotoRegular12
                        .copyWith(color: AppColors.primary),
                  ),
                  verticalSpace(10),
                  ProjectTextField(
                    labelText: '',
                    controller: _controller,
                    maxLines: 8,
                  ),
                  Expanded(child: verticalSpace(20)),
                  FeedbackButton(controller: _controller),
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
