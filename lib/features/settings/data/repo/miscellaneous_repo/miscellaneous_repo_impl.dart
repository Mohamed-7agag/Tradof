import '../../../../../core/api/api_service.dart';
import '../../../../../core/api/end_points.dart';
import '../../model/send_feedback_request_model.dart';
import '../../model/subscription_model.dart';
import '../../model/technical_support_message_model.dart';
import 'miscellaneous_repo.dart';

class MiscellaneousRepoImpl implements MiscellaneousRepo {
  final ApiServices _apiServices;

  MiscellaneousRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  @override
  Future<void> sendFeedback({
    required SendFeedbackRequestModel model,
  }) async {
    await _apiServices.post(
      EndPoint.feedback,
      data: model.toJson(),
    );
  }

  @override
  Future<void> askQuestion({
    required String userId,
    required String question,
  }) async {
    await _apiServices.post(
      EndPoint.askQuestion,
      data: {
        'userId': userId,
        'question': question,
      },
    );
  }

  @override
  Future<void> sendTechnicalSupportMessage({
    required String senderId,
    required String message,
  }) async {
    await _apiServices.post(
      EndPoint.technicalSupport,
      data: {
        'senderId': senderId,
        'message': message,
      },
    );
  }

  @override
  Future<List<TechnicalSupportMessageModel>> getTechnicalSupportMessages(
      {required String userId}) async {
    final response = await _apiServices.get(
      '${EndPoint.technicalSupport}/$userId',
    );
    return List<TechnicalSupportMessageModel>.from(
      response['messages'].map(
        (message) => TechnicalSupportMessageModel.fromJson(message),
      ),
    );
  }

  @override
  Future<SubscriptionModel> getSubscription() async {
    final response = await _apiServices.get(
      EndPoint.getSubscription,
    );
    return SubscriptionModel.fromJson(response['data']);
  }
}
