import '../../../../projects/data/models/pay_project_request_model.dart';
import '../../../../projects/data/models/pay_project_response_model.dart';
import '../../../../projects/data/models/project_payment_status_model.dart';
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
  Future<bool> getCurrentSubscription({required String companyId});

  
  Future<PayProjectResponseModel> payProject({required PayProjectRequestModel payProjectRequestModel});
  Future<ProjectPaymentStatusModel> getPaymentStatus({required int projectId});

}
