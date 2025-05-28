import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/model/notification_setting_model.dart';
import '../../../data/model/send_feedback_request_model.dart';
import '../../../data/model/subscription_model.dart';
import '../../../data/model/technical_support_message_model.dart';
import '../../../data/repo/miscellaneous_repo/miscellaneous_repo.dart';

part 'miscellaneous_state.dart';

class MiscellaneousCubit extends Cubit<MiscellaneousState> {
  MiscellaneousCubit(this._miscellaneousRepo)
      : super(const MiscellaneousState());
  final MiscellaneousRepo _miscellaneousRepo;

  Future<void> sendFeedback({required SendFeedbackRequestModel model}) async {
    emit(state.copyWith(status: MiscellaneousStatus.sendFeedbackLoading));
    try {
      await _miscellaneousRepo.sendFeedback(model: model);
      emit(state.copyWith(
        status: MiscellaneousStatus.sendFeedbackSuccess,
        message: 'Feedback Sent Successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MiscellaneousStatus.sendFeedbackFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> askQuestion({required String question}) async {
    emit(state.copyWith(status: MiscellaneousStatus.askQuestionLoading));
    try {
      await _miscellaneousRepo.askQuestion(
          question: question, userId: AppConstants.kUserId);
      emit(state.copyWith(
        status: MiscellaneousStatus.askQuestionSuccess,
        message: 'Question Sent Successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MiscellaneousStatus.askQuestionFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> sendTechnicalSupportMessage({required String message}) async {
    emit(state.copyWith(
        status: MiscellaneousStatus.sendTechnicalSupportLoading));
    try {
      await _miscellaneousRepo.sendTechnicalSupportMessage(
        message: message,
        senderId: AppConstants.kUserId,
      );
      final messageModel = TechnicalSupportMessageModel(
        message: message,
        senderId: AppConstants.kUserId,
        timestamp: DateTime.now(),
        id: '0',
      );
      emit(state.copyWith(
        status: MiscellaneousStatus.sendTechnicalSupportSuccess,
        technicalSupportMessages: List.from(state.technicalSupportMessages)
          ..add(messageModel),
      ));
      emit(state.copyWith(
        status: MiscellaneousStatus.getTechnicalSupportMessagesSuccess,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MiscellaneousStatus.sendTechnicalSupportFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> getTechnicalSupportMessages() async {
    emit(state.copyWith(
        status: MiscellaneousStatus.getTechnicalSupportMessagesLoading));
    try {
      final messages = await _miscellaneousRepo.getTechnicalSupportMessages(
          userId: AppConstants.kUserId);
      emit(state.copyWith(
        status: MiscellaneousStatus.getTechnicalSupportMessagesSuccess,
        technicalSupportMessages: messages,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MiscellaneousStatus.getTechnicalSupportMessagesFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> getSubscription() async {
    emit(state.copyWith(status: MiscellaneousStatus.getSubscriptionLoading));
    try {
      final subscription = await _miscellaneousRepo.getSubscription();
      emit(state.copyWith(
        status: MiscellaneousStatus.getSubscriptionSuccess,
        subscriptionModel: subscription,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MiscellaneousStatus.getSubscriptionFailure,
        errMessage: 'No subscription found',
      ));
    }
  }

  void setRate(String rate) {
    emit(state.copyWith(rate: rate));
  }

  Future<void> updateNotificationSetting(
      {int? sendEmail, int? alertOffers, int? messageChat}) async {
    emit(state.copyWith(
        status: MiscellaneousStatus.updateNotificationSettingLoading));
    try {
      await _miscellaneousRepo.updateNotificationSettings(
        NotificationSettingModel(
          sendEmail: sendEmail ?? state.notificationSettingModel?.sendEmail ??0,
          alertOffers:
              alertOffers ?? state.notificationSettingModel?.alertOffers ??0,
          messageChat:
              messageChat ?? state.notificationSettingModel?.messageChat ??0,
        ),
      );
      emit(state.copyWith(
        status: MiscellaneousStatus.updateNotificationSettingSuccess,
        message: 'Settings Updated Successfully',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MiscellaneousStatus.updateNotificationSettingFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> getNotificationSetting({required String userId}) async {
    emit(state.copyWith(
        status: MiscellaneousStatus.getNotificationSettingLoading));
    try {
      final notificationSettingModel =
          await _miscellaneousRepo.getNotificationSettings(userId);
      emit(state.copyWith(
        status: MiscellaneousStatus.getNotificationSettingSuccess,
        notificationSettingModel: notificationSettingModel,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MiscellaneousStatus.getNotificationSettingFailure,
        errMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }
}
