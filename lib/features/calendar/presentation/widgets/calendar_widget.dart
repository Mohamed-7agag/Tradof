import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../../settings/data/model/event_model.dart';
import '../../data/model/create_event_request_model.dart';
import '../logic/calendar_cubit/calendar_cubit.dart';

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
            onTap: (CalendarTapDetails details) {
              if (details.targetElement == CalendarElement.calendarCell) {
                _showAddEventDialog(context, details.date!);
              }
            },
            showTodayButton: true,
            showDatePickerButton: true,
            monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
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

  void _showAddEventDialog(BuildContext context, DateTime selectedDate) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final DateTime startTime = selectedDate;
    final DateTime endTime = selectedDate.add(const Duration(hours: 1));

    AwesomeDialog(
      context: context,
      animType: AnimType.rightSlide,
      dialogType: DialogType.noHeader,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Event',
              style: AppStyle.poppinsMedium15,
            ),
            verticalSpace(16),
            CustomTextField(
              labelText: 'Title',
              controller: titleController,
              outlineBorder: true,
            ),
            verticalSpace(14),
            CustomTextField(
              labelText: 'Description',
              controller: descriptionController,
              outlineBorder: true,
            ),
          ],
        ),
      ),
      btnOkOnPress: () {
        if (titleController.text.trim().isEmpty ||
            descriptionController.text.trim().isEmpty) {
          errorToast(context, 'Error', 'Please fill all the fields');
          return;
        }
        final event = CreateEventRequestModel(
          title: titleController.text,
          description: descriptionController.text,
          startTime: startTime,
          endTime: endTime,
        );
        context.read<CalendarCubit>().createEvent(model: event);
      },
      btnOkText: 'Add',
      btnCancelOnPress: () {},
    ).show();
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<EventModel> events) {
    appointments = events;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endTime;
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
