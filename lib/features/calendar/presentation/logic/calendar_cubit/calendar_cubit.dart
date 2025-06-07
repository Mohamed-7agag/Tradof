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
      final response = await _calendarRepo.createCalendar();
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

  Future<void> createEvent({required EventRequestModel model}) async {
    emit(state.copyWith(
        status: CalendarStatus.createOrUpdateOrDeleteEventLoading));
    try {
      final response = await _calendarRepo.createEvent(
        model: model,
      );
      emit(state.copyWith(
        status: CalendarStatus.createOrUpdateOrDeleteEventSuccess,
        message: 'Event created successfully',
      ));
      emit(state.copyWith(
        status: CalendarStatus.getAllEventsSuccess,
        events: [...state.events, response],
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CalendarStatus.createOrUpdateOrDeleteEventFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> getAllEvents({
    required int year,
    required int month,
    required int day,
  }) async {
    emit(state.copyWith(status: CalendarStatus.getAllEventsLoading));
    try {
      final allEvents = await _calendarRepo.getAllEvents(
        year: year,
        month: month,
        day: day,
      );
      if (isClosed) return;

      emit(state.copyWith(
        status: CalendarStatus.getAllEventsSuccess,
        events: allEvents,
      ));
    } catch (e) {
      if (isClosed) return;
      emit(state.copyWith(
        status: CalendarStatus.getAllEventsFailure,
        errorMessage:
            ServerFailure.fromError(e).errMessage.contains('success: false')
                ? 'Invalid Calendar ID'
                : ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> updateEvent(
      {required EventRequestModel model, required String eventId}) async {
    emit(state.copyWith(
        status: CalendarStatus.createOrUpdateOrDeleteEventLoading));
    try {
      final response = await _calendarRepo.updateEvent(
        model: model,
        eventId: eventId,
      );
      final updatedEvents = state.events.map((event) {
        return event.id == response.id ? response : event;
      }).toList();
      emit(state.copyWith(
        status: CalendarStatus.createOrUpdateOrDeleteEventSuccess,
        message: 'Event Updated successfully',
      ));
      emit(state.copyWith(
        status: CalendarStatus.getAllEventsSuccess,
        events: updatedEvents,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CalendarStatus.createOrUpdateOrDeleteEventFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> deleteEvent({required String eventId}) async {
    emit(state.copyWith(
        status: CalendarStatus.createOrUpdateOrDeleteEventLoading));
    try {
      await _calendarRepo.deleteEvent(eventId: eventId);

      final newEvents =
          state.events.where((event) => event.id != eventId).toList();

      emit(state.copyWith(
        status: CalendarStatus.createOrUpdateOrDeleteEventSuccess,
        message: 'Event Deleted successfully',
      ));
      emit(state.copyWith(
        status: CalendarStatus.getAllEventsSuccess,
        events: newEvents,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CalendarStatus.createOrUpdateOrDeleteEventFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }
}
