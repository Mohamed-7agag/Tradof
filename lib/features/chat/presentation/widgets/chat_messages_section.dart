import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/cubit/chat_cubit.dart';
import 'chat_message_bubble.dart';

class ChatMessagesSection extends StatelessWidget {
  const ChatMessagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state.status == ChatStatus.initial ||
            state.status == ChatStatus.connecting ||
            state.status == ChatStatus.loading) {
          return const CustomLoadingWidget();
        }

        if (state.status == ChatStatus.error) {
          return CustomFailureWidget(
            text: state.errorMessage,
            onRetry: () => context.read<ChatCubit>().connect(),
          );
        }

        if (state.messages.isEmpty) {
          return const CustomFailureWidget(text: 'No messages yet!');
        }

        return ListView.builder(
          reverse: true,
          itemCount: state.messages.length,
          itemBuilder: (context, index) {
            final message = state.messages.reversed.toList()[index];

            return ChatMessageBubble(message: message);
          },
        );
      },
    );
  }
}
