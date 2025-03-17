import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../projects/presentation/widgets/project_text_field.dart';
import '../widgets/ask_question_button.dart';

class AskQuestionView extends StatefulWidget {
  const AskQuestionView({super.key});

  @override
  State<AskQuestionView> createState() => _AskQuestionViewState();
}

class _AskQuestionViewState extends State<AskQuestionView> {
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
        title: 'Ask Question',
        actionIcon: HugeIcons.strokeRoundedHelpCircle,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  verticalSpace(10),
                  Image.asset(
                    'assets/images/help.png',
                    height: 220,
                  ),
                  verticalSpace(14),
                  ProjectTextField(
                    labelText: 'Your Question',
                    controller: _controller,
                    maxLines: 8,
                  ),
                  Expanded(child: verticalSpace(20)),
                  AskQuestionButton(controller: _controller),
                  verticalSpace(20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
