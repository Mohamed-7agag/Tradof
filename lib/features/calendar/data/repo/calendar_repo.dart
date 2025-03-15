import '../../../settings/data/model/event_model.dart';
import '../model/create_event_request_model.dart';

abstract class CalendarRepo {
  Future<dynamic> createCalendar({required String userId});
  Future<void> createEvent({
    required CreateEventRequestModel model,
    required String calendarId,
  });
  Future<List<EventModel>> getAllEvents({
    required String calendarId,
  });
}
