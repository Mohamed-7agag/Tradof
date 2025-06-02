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
      buildWhen: (previous, current) {
        return current.status.isError ||
            current.status.isLoading ||
            current.status.isLoaded;
      },
      builder: (context, state) {
        if (state.status.isLoading) {
          return const CustomLoadingWidget();
        }
        if (state.status.isError) {
          return CustomFailureWidget(text: state.errorMessage);
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
