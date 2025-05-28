import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
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
      // Set project context with required parameters
      chatCubit.setContext(
        projectId: '24',
        freelancerId: AppConstants.kUserId,
        companyId: 'cbe2805d-6670-4e7f-b6bf-0b9152df089f',
      );
      _initializeChat();
    });
  }

  Future<void> _initializeChat() async {
    final chatCubit = context.read<ChatCubit>();
    try {
      await chatCubit.connect();
      chatCubit.loadMessages();
    } catch (e) {
      // Error will be handled by the cubit's state
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: 'Chat'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocListener<ChatCubit, ChatState>(
          listenWhen: (prev, curr) => curr.status == ChatStatus.error,
          listener: (context, state) {
            if(state.status == ChatStatus.error) {
              errorToast(context, 'Error', state.errorMessage);
            }
            
          },
          child: Column(
            children: [
              const Expanded(child: ChatMessagesSection()),
              const SendMessageSection(),
              verticalSpace(6),
            ],
          ),
        ),
      ),
    );
  }
}
