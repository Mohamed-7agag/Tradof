import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../logic/miscellaneous_cubit/miscellaneous_cubit.dart';

class SendQuestionSection extends StatefulWidget {
  const SendQuestionSection({super.key});

  @override
  State<SendQuestionSection> createState() => _SendQuestionSectionState();
}

class _SendQuestionSectionState extends State<SendQuestionSection> {
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              labelText: 'Type your question...',
              outlineBorder: true,
              controller: _controller,
              labelBehavior: true,
            ),
          ),
          horizontalSpace(8),
          BlocBuilder<MiscellaneousCubit, MiscellaneousState>(
            buildWhen: (previous, current) => _buildWhen(current),
            builder: (context, state) {
              return state.status.isSendTechnicalSupportLoading
                  ? const CustomLoadingWidget()
                  : IconButton(
                      onPressed: () {
                        if (_controller.text.trim().isNotEmpty) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          context
                              .read<MiscellaneousCubit>()
                              .sendTechnicalSupportMessage(
                                message: _controller.text.trim(),
                              );
                          _controller.clear();
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        color: AppColors.white,
                        size: 26,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(12),
                        fixedSize: const Size(56, 56),
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
  bool _buildWhen(MiscellaneousState state) {
    return state.status.isSendTechnicalSupportLoading ||
        state.status.isSendTechnicalSupportSuccess ||
        state.status.isSendTechnicalSupportFailure;
  }
}
