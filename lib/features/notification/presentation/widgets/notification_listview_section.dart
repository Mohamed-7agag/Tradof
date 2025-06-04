import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../logic/cubit/notification_cubit.dart';
import 'notification_item.dart';

class NotificationListviewSection extends StatelessWidget {
  const NotificationListviewSection({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
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
        if (state.notifications.isEmpty && state.status.isLoaded) {
          return const CustomFailureWidget(text: 'No Notifications yet!');
        }
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 14),
          itemCount: state.notifications.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: NotificationItem(
                notification: state.notifications[index],
              ),
            );
          },
        );
      },
    );
  }
}
