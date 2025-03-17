import '../../../settings/data/model/event_model.dart';
import '../model/create_event_request_model.dart';

abstract class CalendarRepo {
  Future<dynamic> createCalendar({
    required String userId,
  });
  Future<EventModel> createEvent({
    required EventRequestModel model,
    required String calendarId,
  });
  Future<List<EventModel>> getAllEvents({
    required String calendarId,
    required int year,
    required int month,
    required int day,
  });
  Future<EventModel> updateEvent({
    required EventRequestModel model,
    required String eventId,
  });
  Future<void> deleteEvent({
    required String eventId,
  });
}
