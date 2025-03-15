import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_loading_dialog.dart';
import '../../../../core/utils/widgets/custom_toastification.dart';
import '../logic/calendar_cubit/calendar_cubit.dart';
import '../widgets/calendar_widget.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Calender',
        actionIcon: HugeIcons.strokeRoundedCalendar02,
      ),
      body: BlocListener<CalendarCubit, CalendarState>(
        listenWhen: (previous, current) => _listenWhen(current),
        listener: (context, state) {
          if (state.status.isCreateEventSuccess) {
            context.pop();
            successToast(context, 'Success', state.message);
          } else if (state.status.isCreateEventFailure) {
            context.pop();
            errorToast(context, 'Error', state.errorMessage);
          } else if (state.status.isCreateEventLoading) {
            loadingDialog(context);
          }
        },
        child: const CalendarWidget(),
      ),
    );
  }

  bool _listenWhen(CalendarState current) {
    return current.status.isCreateEventSuccess ||
        current.status.isCreateEventFailure ||
        current.status.isCreateEventLoading;
  }
}
