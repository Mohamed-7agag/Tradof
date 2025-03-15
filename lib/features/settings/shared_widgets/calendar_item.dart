import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/cache/cache_helper.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/app_style.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/widgets/custom_loading_dialog.dart';
import '../../../core/utils/widgets/custom_toastification.dart';
import '../../calendar/presentation/logic/calendar_cubit/calendar_cubit.dart';
import 'setting_item.dart';

class CalendarItem extends StatelessWidget {
  const CalendarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalendarCubit, CalendarState>(
      listenWhen: (previous, current) => _listenWhen(current),
      listener: (context, state) {
        if (state.status.isCreateCalendarSuccess) {
          _onCalendarCreated(context, state);
        } else if (state.status.isCreateCalendarFailure) {
          context.pop();
          errorToast(context, 'Error', state.errorMessage);
        } else if (state.status.isCreateCalendarLoading) {
          loadingDialog(context);
        }
      },
      child: SettingItem(
        title: 'Calendar',
        icon: const HugeIcon(
          icon: HugeIcons.strokeRoundedCalendar02,
          color: Colors.amber,
        ),
        onTap: () {
          if (CacheHelper.getString(AppConstants.calenderId) != '') {
            context.pushNamed(Routes.calendarViewRoute);
          } else {
            _showCreateCalendarDialog(context);
          }
        },
      ),
    );
  }

bool _listenWhen(CalendarState current) {
    return current.status.isCreateCalendarSuccess ||
        current.status.isCreateCalendarFailure ||
        current.status.isCreateCalendarLoading;
  }

  void _onCalendarCreated(BuildContext context, CalendarState state) {
    context.pop();
    successToast(context, 'Success', state.message);
    context.pushNamed(Routes.calendarViewRoute);
  }

  _showCreateCalendarDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      animType: AnimType.rightSlide,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      dialogType: DialogType.question,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text(
          'Welcome to Our Calendar, do you want to create a calendar for you ?',
          textAlign: TextAlign.center,
          style: AppStyle.robotoRegular14.copyWith(height: 1.8),
        ),
      ),
      btnOkOnPress: context.read<CalendarCubit>().createCalendar,
      btnCancelOnPress: () {},
      btnOkText: 'Create',
    ).show();
  }
}
