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
  Future<dynamic> createCalendar() async {
    return await _apiServices.post(
      EndPoint.calendar,
    );
  }

  @override
  Future<EventModel> createEvent({
    required EventRequestModel model,
  }) async {
    final response = await _apiServices.post(
      EndPoint.createEvent,
      data: model.toJson(),
    );
    return EventModel.fromJson(response['event']);
  }

  @override
  Future<List<EventModel>> getAllEvents({
    required int year,
    required int month,
    required int day,
  }) async {
    final response = await _apiServices.get(EndPoint.getAllEvents,
        queryParameters: {'day': day, 'month': month, 'year': year});
    return List<EventModel>.from(response['data'].map(
      (e) => EventModel.fromJson(e),
    ));
  }

  @override
  Future<EventModel> updateEvent({
    required EventRequestModel model,
    required String eventId,
  }) async {
    final response = await _apiServices.patch(
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
