import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_style.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../../data/model/create_event_request_model.dart';
import '../logic/calendar_cubit/calendar_cubit.dart';

void showAddEventDialog(BuildContext context, DateTime selectedDate) {
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
      final event = EventRequestModel(
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
