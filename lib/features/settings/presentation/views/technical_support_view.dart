import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/miscellaneous_cubit/miscellaneous_cubit.dart';
import '../widgets/send_question_section.dart';
import '../widgets/technical_support_body.dart';

class TechnicalSupportView extends StatelessWidget {
  const TechnicalSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Technical Support',
        actionIcon: HugeIcons.strokeRoundedCustomerService02,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            BlocBuilder<MiscellaneousCubit, MiscellaneousState>(
              buildWhen: (previous, current) => _buildWhen(current),
              builder: (context, state) {
                if (state.status.isGetTechnicalSupportMessagesSuccess) {
                  return Expanded(
                      child: TechnicalSupportBody(
                    messages: state.technicalSupportMessages,
                  ));
                } else if (state.status.isGetTechnicalSupportMessagesFailure) {
                  return Expanded(
                    child: CustomFailureWidget(text: state.errMessage),
                  );
                }
                return const Expanded(child: CustomLoadingWidget());
              },
            ),
            const SendQuestionSection(),
            verticalSpace(6),
          ],
        ),
      ),
    );
  }

  bool _buildWhen(MiscellaneousState state) {
    return state.status.isGetTechnicalSupportMessagesFailure ||
        state.status.isGetTechnicalSupportMessagesLoading ||
        state.status.isGetTechnicalSupportMessagesSuccess;
  }
}
