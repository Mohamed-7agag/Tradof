import 'package:flutter/widgets.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/app_constants.dart';
import '../../data/model/chat_message_model.dart';

class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({required this.message, super.key});
  final ChatMessageModel message;

  bool isSender() {
    return message.senderId == AppConstants.kUserId;
  }

  String convertTime() {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(message.timestamp);
    final String hourAndMinute = DateFormat('hh:mm', 'en').format(dateTime);
    final String type = DateFormat('a').format(dateTime);
    return '$hourAndMinute $type';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2, top: 3),
      child: ChatBubble(
        backGroundColor: isSender()
            ? AppColors.primary
            : AppColors.darkGrey,
        clipper: ChatBubbleClipper1(
          type: isSender() ? BubbleType.sendBubble : BubbleType.receiverBubble,
          nipWidth: 8,
          nipRadius: 2,
          radius: 8,
        ),
        alignment: isSender() ? Alignment.centerRight : Alignment.centerLeft,
        elevation: 0,
        padding: EdgeInsets.only(
          left: isSender() ? 10 : 16,
          right: isSender() ? 16 : 10,
          top: 5,
          bottom: 4,
        ),
        child: IntrinsicWidth(
          stepWidth: 10,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Wrap(
              runSpacing: 2,
              clipBehavior: Clip.hardEdge,
              crossAxisAlignment: WrapCrossAlignment.end,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    message.message,
                    style: AppStyle.poppinsMedium14
                        .copyWith(height: 1.6, color: AppColors.white),
                  ),
                ),

                horizontalSpace(6),
                Text(
                  convertTime(),
                  style:
                      AppStyle.robotoMedium10.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
