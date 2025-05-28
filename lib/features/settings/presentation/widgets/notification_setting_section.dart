import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/widgets/custom_loading_dialog.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/miscellaneous_cubit/miscellaneous_cubit.dart';
import 'notification_setting_switcher_item.dart';

class NotificationSettingSection extends StatefulWidget {
  const NotificationSettingSection({super.key});

  @override
  State<NotificationSettingSection> createState() =>
      _NotificationSettingSectionState();
}

class _NotificationSettingSectionState
    extends State<NotificationSettingSection> {
  bool? optionOneValue;
  bool? optionTwoValue;
  bool? optionThreeValue;

  @override
  void initState() {
    super.initState();
    context
        .read<MiscellaneousCubit>()
        .getNotificationSetting(userId: AppConstants.kUserId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MiscellaneousCubit, MiscellaneousState>(
      listenWhen: (previous, current) => _listenWhen(current),
      buildWhen: (previous, current) => _buildWhen(current),
      listener: (context, state) {
        if (state.status.isUpdateNotificationSettingSuccess) {
          context.pop();
          successToast(context, 'Success', state.message);
        } else if (state.status.isUpdateNotificationSettingFailure) {
          context.pop();
          errorToast(context, 'Error', state.errMessage);
        } else if (state.status.isUpdateNotificationSettingLoading) {
          loadingDialog(context);
        }
      },
      builder: (context, state) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: const BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          children: [
            NotificationSettingSwitcherItem(
              value: optionOneValue ?? state.notificationSettingModel?.sendEmail == 1,
              title: 'Enable email alerts',
              subTitle: 'Notify about matching projects',
              onChanged: (value) {
                setState(() {
                  optionOneValue = value;
                  context
                      .read<MiscellaneousCubit>()
                      .updateNotificationSetting(sendEmail: value ? 1 : 0);
                });
              },
            ),
            const Divider(color: AppColors.cardDarkColor, height: 0),
            NotificationSettingSwitcherItem(
              value: optionTwoValue ?? state.notificationSettingModel?.alertOffers == 1,
              title: 'Offer status alerts',
              subTitle: 'Get notified about offer approvals or rejections',
              onChanged: (value) {
                setState(() {
                  optionTwoValue = value;
                  context
                      .read<MiscellaneousCubit>()
                      .updateNotificationSetting(alertOffers: value ? 1 : 0);
                });
              },
            ),
            const Divider(color: AppColors.cardDarkColor, height: 0),
            NotificationSettingSwitcherItem(
              value: optionThreeValue ?? state.notificationSettingModel?.messageChat == 1,
              title: 'Client message alerts',
              subTitle: 'Get notified when project owners message you',
              onChanged: (value) {
                setState(() {
                  optionThreeValue = value;
                  context
                      .read<MiscellaneousCubit>()
                      .updateNotificationSetting(messageChat: value ? 1 : 0);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _listenWhen(MiscellaneousState state) {
    return state.status.isUpdateNotificationSettingSuccess ||
        state.status.isUpdateNotificationSettingFailure ||
        state.status.isUpdateNotificationSettingLoading;
  }
  bool _buildWhen(MiscellaneousState state) {
    return state.status.isGetNotificationSettingSuccess ||
        state.status.isGetNotificationSettingFailure ||
        state.status.isGetNotificationSettingLoading;
  }
}
