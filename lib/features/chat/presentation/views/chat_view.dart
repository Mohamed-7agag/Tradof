import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/cubit/chat_cubit.dart';
import '../widgets/chat_messages_section.dart';
import '../widgets/send_message_section.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final chatCubit = context.read<ChatCubit>();
      chatCubit.initializeChat(
        projectId: 55,
        freelancerId: AppConstants.kUserId,
        companyId: 'cbe2805d-6670-4e7f-b6bf-0b9152df089f',
      );
    });
  }

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
