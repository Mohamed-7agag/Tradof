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
        title: 'Calendar',
        actionIcon: HugeIcons.strokeRoundedCalendar02,
      ),
      body: BlocListener<CalendarCubit, CalendarState>(
        listenWhen: (previous, current) => _listenWhen(current),
        listener: (context, state) {
          if (state.status.isCreateOrUpdateOrDeleteEventSuccess) {
            context.pop();
            successToast(context, 'Success', state.message);
          } else if (state.status.isCreateOrUpdateOrDeleteEventFailure) {
            context.pop();
            errorToast(context, 'Error', state.errorMessage);
          } else if (state.status.isCreateOrUpdateOrDeleteEventLoading) {
            loadingDialog(context);
          }
        },
        child: const CalendarWidget(),
      ),
    );
  }

  bool _listenWhen(CalendarState current) {
    return current.status.isCreateOrUpdateOrDeleteEventSuccess ||
        current.status.isCreateOrUpdateOrDeleteEventFailure ||
        current.status.isCreateOrUpdateOrDeleteEventLoading;
  }
}
