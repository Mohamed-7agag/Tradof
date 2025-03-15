import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../data/model/send_feedback_request_model.dart';
import '../logic/feedback_cubit/feedback_cubit.dart';

class FeedbackButton extends StatelessWidget {
  const FeedbackButton({required this.controller, super.key});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedbackCubit, FeedbackState>(
      listener: (context, state) {
        if (state.status.isSendFeedbackSuccess) {
          successToast(context, 'Success', state.message);
          context.pop();
        } else if (state.status.isSendFeedbackFailure) {
          errorToast(context, 'Error', state.errMessage);
        }
      },
      builder: (context, state) {
        return state.status.isSendFeedbackLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Send Feedback',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (controller.text.trim().isEmpty) {
                    errorToast(context, 'Error', 'Please enter your feedback reason');
                    return;
                  }
                  final model = SendFeedbackRequestModel(
                    userId: AppConstants.kUserId,
                    rate: state.rate,
                    reasonRate: controller.text.trim(),
                  );
                  context.read<FeedbackCubit>().sendFeedback(model: model);
                },
              );
      },
    );
  }
}
