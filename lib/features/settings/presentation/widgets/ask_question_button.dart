import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/miscellaneous_cubit/miscellaneous_cubit.dart';

class AskQuestionButton extends StatelessWidget {
  const AskQuestionButton({required this.controller, super.key});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MiscellaneousCubit, MiscellaneousState>(
      listenWhen: (previous, current) => _buildAndListenWhen(current),
      buildWhen: (previous, current) => _buildAndListenWhen(current),
      listener: (context, state) {
        if (state.status.isAskQuestionSuccess) {
          successToast(context, 'Success', state.message);
          context.pop();
        } else if (state.status.isAskQuestionFailure) {
          errorToast(context, 'Error', state.errMessage);
        }
      },
      builder: (context, state) {
        return state.status.isAskQuestionLoading
            ? const CustomLoadingWidget()
            : CustomButton(
                text: 'Send Question',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (controller.text.trim().isEmpty) {
                    errorToast(context, 'Error', 'Please enter your Question');
                    return;
                  }
                  context.read<MiscellaneousCubit>().askQuestion(
                        question: controller.text.trim(),
                      );
                },
              );
      },
    );
  }

  bool _buildAndListenWhen(MiscellaneousState current) {
    return current.status.isAskQuestionFailure ||
        current.status.isAskQuestionLoading ||
        current.status.isAskQuestionSuccess;
  }
}
