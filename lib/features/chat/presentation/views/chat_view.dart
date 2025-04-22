import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: ChatMessagesSection()),
            const SendMessageSection(),
            verticalSpace(6),
          ],
        ),
      ),
    );
  }
}
