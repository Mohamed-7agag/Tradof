import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/cubit/chat_cubit.dart';
import '../widgets/chat_messages_section.dart';
import '../widgets/send_message_section.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: 'Chat'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<ChatCubit, ChatState>(
          buildWhen: (previous, current) {
            return current.status.isConnected ||
                current.status.isConnecting ||
                current.status.isConnectionError ||
                current.status.isDisconnected;
          },
          builder: (context, state) {
            switch (state.status) {
              case ChatStatus.connecting:
                return const CustomLoadingWidget();
              case ChatStatus.connected:
                return Column(
                  children: [
                    const Expanded(child: ChatMessagesSection()),
                    const SendMessageSection(),
                    verticalSpace(6),
                  ],
                );
              case ChatStatus.connectionError || ChatStatus.disconnected:
                return CustomFailureWidget(text: state.errorMessage);
              default:
                return const CustomLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
