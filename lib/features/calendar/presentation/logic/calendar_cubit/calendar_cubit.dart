import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../settings/data/model/event_model.dart';
import '../../../data/model/create_event_request_model.dart';
import '../../../data/repo/calendar_repo.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit(this._calendarRepo) : super(const CalendarState());
  final CalendarRepo _calendarRepo;

  Future<void> createCalendar() async {
    emit(state.copyWith(status: CalendarStatus.createCalendarLoading));
    try {
      final response =
          await _calendarRepo.createCalendar(userId: AppConstants.kUserId);
      CacheHelper.setData(
          key: AppConstants.calenderId, value: response['calendar']['_id']);
      emit(state.copyWith(
        status: CalendarStatus.createCalendarSuccess,
        message: 'Calendar created successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CalendarStatus.createCalendarFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> createEvent({required CreateEventRequestModel model}) async {
    emit(state.copyWith(status: CalendarStatus.createEventLoading));
    try {
      await _calendarRepo.createEvent(
        model: model,
        calendarId: CacheHelper.getString(AppConstants.calenderId),
      );
      emit(state.copyWith(
        status: CalendarStatus.createEventSuccess,
        message: 'Event created successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CalendarStatus.createEventFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> getAllEvents() async {
    emit(state.copyWith(status: CalendarStatus.getAllEventsLoading));
    try {
      final allEvents = await _calendarRepo.getAllEvents(
        calendarId: CacheHelper.getString(AppConstants.calenderId),
      );
      emit(state.copyWith(
        status: CalendarStatus.getAllEventsSuccess,
        events: allEvents,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CalendarStatus.getAllEventsFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }
}
