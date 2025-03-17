import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/model/send_feedback_request_model.dart';
import '../../../data/repo/feedback_repo/feedback_repo.dart';

part 'feedback_state.dart';

class FeedbackCubit extends Cubit<FeedbackState> {
  FeedbackCubit(this._feedbackRepo) : super(const FeedbackState());
  final FeedbackRepo _feedbackRepo;

  Future<void> sendFeedback({required SendFeedbackRequestModel model}) async {
    emit(state.copyWith(status: FeedbackStatus.sendFeedbackLoading));
    try {
      await _feedbackRepo.sendFeedback(model: model);
      emit(state.copyWith(
        status: FeedbackStatus.sendFeedbackSuccess,
        message: 'Feedback Sent Successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FeedbackStatus.sendFeedbackFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> askQuestion({required String question}) async {
    emit(state.copyWith(status: FeedbackStatus.askQuestionLoading));
    try {
      await _feedbackRepo.askQuestion(
          question: question, userId: AppConstants.kUserId);
      emit(state.copyWith(
        status: FeedbackStatus.askQuestionSuccess,
        message: 'Question Sent Successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FeedbackStatus.askQuestionFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  void setRate(String rate) {
    emit(state.copyWith(rate: rate));
  }
}
