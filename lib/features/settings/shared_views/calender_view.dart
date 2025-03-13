import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/utils/widgets/custom_app_bar.dart';
import '../../../core/utils/widgets/custom_button.dart';
import '../model/event_model.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Calender',
        actionIcon: HugeIcons.strokeRoundedCalendar02,
      ),
      body: SfCalendar(
        showNavigationArrow: true,
        todayHighlightColor: AppColors.primary,
        allowedViews: const [
          CalendarView.day,
          CalendarView.week,
          CalendarView.month,
        ],
        firstDayOfWeek: 6,
        onTap: (CalendarTapDetails details) {
          if (details.targetElement == CalendarElement.calendarCell) {
            _showAddEventDialog(context, details.date!);
          }
        },
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        ),
      ),
    );
  }

  void _showAddEventDialog(BuildContext context, DateTime selectedDate) {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String description = '';
        final DateTime startTime = selectedDate;
        final DateTime endTime = selectedDate.add(const Duration(hours: 1));

        return AlertDialog(
          title: const Text('Add Event'),
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) => title = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (value) => description = value,
              ),
              verticalSpace(40),
              CustomButton(
                onPressed: () async {
                  EventModel(
                    id: DateTime.now().toString(),
                    title: title,
                    description: description,
                    startTime: startTime,
                    endTime: endTime,
                  );

                  Navigator.pop(context);
                },
                text: 'Save',
              ),
            ],
          ),
        );
      },
    );
  }
}
