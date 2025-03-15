import '../../../../../core/api/api_service.dart';
import '../../../../../core/api/end_points.dart';
import '../../model/send_feedback_request_model.dart';
import 'feedback_repo.dart';

class FeedbackRepoImpl implements FeedbackRepo {
  final ApiServices _apiServices;

  FeedbackRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  @override
  Future<void> sendFeedback({required SendFeedbackRequestModel model}) async{
      await _apiServices.post(EndPoint.feedback, data: model.toJson());
  }
}
