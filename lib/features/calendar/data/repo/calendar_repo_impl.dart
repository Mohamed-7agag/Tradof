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
  Future<void> createEvent({
    required CreateEventRequestModel model,
    required String calendarId,
  }) async {
    await _apiServices.post(
      EndPoint.createEvent(calendarId),
      data: model.toJson(),
    );
  }

  @override
  Future<List<EventModel>> getAllEvents({required String calendarId}) async {
    final response = await _apiServices
        .get(EndPoint.getAllEvents(calendarId), queryParameters: {
      'day': DateTime.now().day,
      'month': DateTime.now().month,
      'year': DateTime.now().year
    });
    return List<EventModel>.from(response['events'].map(
      (e) => EventModel.fromJson(e),
    ));
  }
}
