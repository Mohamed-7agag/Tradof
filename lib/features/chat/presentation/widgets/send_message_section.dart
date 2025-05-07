import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../logic/cubit/chat_cubit.dart';

class SendMessageSection extends StatefulWidget {
  const SendMessageSection({super.key});

  @override
  State<SendMessageSection> createState() => _SendMessageSectionState();
}

class _SendMessageSectionState extends State<SendMessageSection> {
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
              labelText: 'Type your message...',
              outlineBorder: true,
              controller: _controller,
              labelBehavior: true,
            ),
          ),
          horizontalSpace(8),
          IconButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              if (_controller.text.trim().isNotEmpty) {
                context.read<ChatCubit>().sendMessage(
                      _controller.text.trim(),
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
          )
        ],
      ),
    );
  }
}
