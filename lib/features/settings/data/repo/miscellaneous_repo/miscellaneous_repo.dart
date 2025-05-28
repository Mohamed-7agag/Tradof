import '../../model/notification_setting_model.dart';
import '../../model/send_feedback_request_model.dart';
import '../../model/subscription_model.dart';
import '../../model/technical_support_message_model.dart';

abstract class MiscellaneousRepo {
  Future<void> sendFeedback({required SendFeedbackRequestModel model});
  Future<void> askQuestion({required String userId, required String question});
  Future<void> sendTechnicalSupportMessage({
    required String senderId,
    required String message,
  });
  Future<List<TechnicalSupportMessageModel>> getTechnicalSupportMessages({
    required String userId,
  });
  Future<SubscriptionModel> getSubscription();
  Future<void> updateNotificationSettings(NotificationSettingModel model);
  Future<NotificationSettingModel>getNotificationSettings(String userId);
}
