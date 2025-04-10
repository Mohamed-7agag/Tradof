import 'package:flutter/material.dart';

import '../../data/model/technical_support_message_model.dart';
import 'technical_support_message_item.dart';

class TechnicalSupportBody extends StatelessWidget {
  const TechnicalSupportBody({required this.messages, super.key});
  final List<TechnicalSupportMessageModel> messages;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (_, index) => TechnicalSupportMessageItem(
        message: messages[messages.length - index - 1],
      ),
    );
  }
}
