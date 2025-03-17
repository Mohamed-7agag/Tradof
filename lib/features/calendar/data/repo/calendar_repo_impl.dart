import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../../../settings/data/model/event_model.dart';
import '../model/create_event_request_model.dart';
import 'calendar_repo.dart';

class CalendarRepoImpl implements CalendarRepo {
  final ApiServices _apiServices;

  CalendarRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;

  @override
  Future<dynamic> createCalendar({required String userId}) async {
    return await _apiServices.post(
      EndPoint.calendar,
      data: {'userId': userId},
    );
  }

  @override
  Future<EventModel> createEvent({
    required EventRequestModel model,
    required String calendarId,
  }) async {
    final response = await _apiServices.post(
      EndPoint.createEvent(calendarId),
      data: model.toJson(),
    );
    return EventModel.fromJson(response['event']);
  }

  @override
  Future<List<EventModel>> getAllEvents({
    required String calendarId,
    required int year,
    required int month,
    required int day,
  }) async {
    final response = await _apiServices.get(EndPoint.getAllEvents(calendarId),
        queryParameters: {'day': day, 'month': month, 'year': year});
    return List<EventModel>.from(response['events'].map(
      (e) => EventModel.fromJson(e),
    ));
  }

  @override
  Future<EventModel> updateEvent({
    required EventRequestModel model,
    required String eventId,
  }) async {
    final response = await _apiServices.put(
      EndPoint.updateOrDeleteEvent(eventId),
      data: model.toJson(),
    );
    return EventModel.fromJson(response['event']);
  }

  @override
  Future<void> deleteEvent({required String eventId}) async {
    await _apiServices.delete(
      EndPoint.updateOrDeleteEvent(eventId),
    );
  }
}
