import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../../settings/data/model/event_model.dart';
import '../../data/model/create_event_request_model.dart';
import '../logic/calendar_cubit/calendar_cubit.dart';

showUpdateOrDeleteEventDialog(BuildContext context, EventModel event) {
  final TextEditingController titleController =
      TextEditingController(text: event.title);
  final TextEditingController descriptionController =
      TextEditingController(text: event.description);

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
      if (titleController.text.trim() == event.title &&
          descriptionController.text.trim() == event.description) {
        return;
      }
      final updatedEvent = EventRequestModel(
        title: titleController.text,
        description: descriptionController.text,
        startDate: event.startDate,
        endDate: event.endDate,
      );
      context.read<CalendarCubit>().updateEvent(
            eventId: event.id,
            model: updatedEvent,
          );
    },
    btnOkText: 'Update',
    btnCancelText: 'Delete',
    btnCancelOnPress: () {
      context.read<CalendarCubit>().deleteEvent(
            eventId: event.id,
          );
    },
  ).show();
}
