import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../settings/data/model/event_model.dart';
import '../logic/calendar_cubit/calendar_cubit.dart';
import 'add_event_dialog.dart';
import 'event_details_dialog.dart';
import 'update_or_delete_event_dialog.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      buildWhen: (previous, current) => _buildWhen(current),
      builder: (context, state) {
        if (state.status.isGetAllEventsSuccess) {
          return SfCalendar(
            showNavigationArrow: true,
            todayHighlightColor: AppColors.primary,
            allowedViews: const [
              CalendarView.day,
              CalendarView.week,
              CalendarView.month,
            ],
            firstDayOfWeek: 6,
            dataSource: EventDataSource(state.events),
            headerStyle: const CalendarHeaderStyle(
              backgroundColor: AppColors.background,
            ),
            onTap: (CalendarTapDetails details) {
              if (details.targetElement == CalendarElement.calendarCell) {
                showAddEventDialog(context, details.date!);
              } else {
                showEventDetailDialog(
                  context,
                  details.appointments!.first,
                );
              }
            },
            onLongPress: (details) {
              if (details.targetElement != CalendarElement.calendarCell) {
                showUpdateOrDeleteEventDialog(
                  context,
                  details.appointments!.first,
                );
              }
            },
            showTodayButton: true,
            showDatePickerButton: true,
            monthViewSettings: const MonthViewSettings(
              showAgenda: true,
            ),
          );
        } else if (state.status.isGetAllEventsFailure) {
          return CustomFailureWidget(text: state.errorMessage);
        }
        return const CustomLoadingWidget();
      },
    );
  }

  bool _buildWhen(CalendarState current) {
    return current.status.isGetAllEventsSuccess ||
        current.status.isGetAllEventsFailure ||
        current.status.isGetAllEventsLoading;
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<EventModel> events) {
    appointments = events;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startDate;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endDate;
  }

  @override
  String getSubject(int index) {
    return appointments![index].title;
  }

  @override
  String getNotes(int index) {
    return appointments![index].description;
  }
}
