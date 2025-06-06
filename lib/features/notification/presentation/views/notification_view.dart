import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/cubit/notification_cubit.dart';
import '../widgets/notification_listview_section.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Notifications',
        actionIcon: HugeIcons.strokeRoundedNotification03,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<NotificationCubit, NotificationState>(
          buildWhen: (previous, current) {
            return current.status.isConnected ||
                current.status.isConnecting ||
                current.status.isConnectionError ||
                current.status.isDisconnected;
          },
          builder: (context, state) {
            switch (state.status) {
              case NotificationStatus.connecting:
                return const CustomLoadingWidget();
              case NotificationStatus.connected:
                return const NotificationListviewSection();
              case NotificationStatus.connectionError:
              case NotificationStatus.disconnected:
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
