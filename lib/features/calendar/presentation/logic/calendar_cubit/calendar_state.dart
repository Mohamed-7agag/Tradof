part of 'calendar_cubit.dart';

enum CalendarStatus {
  initial,
  createCalendarLoading,
  createCalendarSuccess,
  createCalendarFailure,
  createOrUpdateOrDeleteEventLoading,
  createOrUpdateOrDeleteEventSuccess,
  createOrUpdateOrDeleteEventFailure,
  getAllEventsLoading,
  getAllEventsSuccess,
  getAllEventsFailure
}

extension CalendarStatusX on CalendarStatus {
  bool get isCreateCalendarLoading =>
      this == CalendarStatus.createCalendarLoading;
  bool get isCreateCalendarSuccess =>
      this == CalendarStatus.createCalendarSuccess;
  bool get isCreateCalendarFailure =>
      this == CalendarStatus.createCalendarFailure;

  bool get isCreateOrUpdateOrDeleteEventLoading =>
      this == CalendarStatus.createOrUpdateOrDeleteEventLoading;
  bool get isCreateOrUpdateOrDeleteEventSuccess =>
      this == CalendarStatus.createOrUpdateOrDeleteEventSuccess;
  bool get isCreateOrUpdateOrDeleteEventFailure =>
      this == CalendarStatus.createOrUpdateOrDeleteEventFailure;

  bool get isGetAllEventsLoading => this == CalendarStatus.getAllEventsLoading;
  bool get isGetAllEventsSuccess => this == CalendarStatus.getAllEventsSuccess;
  bool get isGetAllEventsFailure => this == CalendarStatus.getAllEventsFailure;
}

class CalendarState extends Equatable {
  final CalendarStatus status;
  final String errorMessage;
  final String message;
  final List<EventModel> events;
  const CalendarState({
    this.status = CalendarStatus.initial,
    this.errorMessage = '',
    this.message = '',
    this.events = const [],
  });

  CalendarState copyWith({
    CalendarStatus? status,
    String? errorMessage,
    String? message,
    List<EventModel>? events,
  }) {
    return CalendarState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      message: message ?? this.message,
      events: events ?? this.events,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        message,
        events,
      ];
}
