import '../../model/send_feedback_request_model.dart';

abstract class FeedbackRepo {
  Future<void> sendFeedback({required SendFeedbackRequestModel model});
  Future<void> askQuestion({required String userId, required String question});
}