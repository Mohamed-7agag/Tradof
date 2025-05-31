import 'dart:developer';

import '../../../../../core/api/api_service.dart';
import '../../../../../core/api/end_points.dart';
import '../../model/notification_setting_model.dart';
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

  @override
  Future<void> updateNotificationSettings(
      NotificationSettingModel model) async {
    await _apiServices.patch(
      EndPoint.patchNotificationSetting,
      data: model.toJson(),
    );
  }

  @override
  Future<NotificationSettingModel> getNotificationSettings(
      String userId) async {
    log('userId : $userId');
    final response = await _apiServices.get(
      EndPoint.notificationSetting(userId),
    );
    return NotificationSettingModel.fromJson(response['data']);
  }
  @override
  Future<bool> getCurrentSubscription({required String companyId}) async {
    final response = await _apiServices.get(
      EndPoint.getCurrentSubscription(companyId),
    );
    return response['success'] as bool;
  }
}
