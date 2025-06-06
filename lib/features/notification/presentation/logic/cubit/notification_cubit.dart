import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/services/notification_service.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/model/notification_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._notificationService)
      : super(const NotificationState());
  final NotificationService _notificationService;
  StreamSubscription? _notificationsSub;
  StreamSubscription? _connectionSub;
  StreamSubscription? _errorSub;

  Future<void> initialize() async {
    await _connectAndListen();
    if (!_notificationService.isConnected) {
      await _notificationService.connectionStream
          .firstWhere((connected) => connected);
    }
    await loadNotifications();
  }

  Future<void> _connectAndListen() async {
    if (_notificationService.isConnected) {
      emit(state.copyWith(status: NotificationStatus.connected));
      return;
    }

    final completer = Completer<void>();
    StreamSubscription? tempSub;
    tempSub = _notificationService.connectionStream.listen((connected) {
      if (isClosed) return;
      if (connected) {
        completer.complete();
        tempSub?.cancel();
      }
    }, onError: (e) {
      completer.completeError(e);
      tempSub?.cancel();
    });

    await _notificationService.connect();
    await completer.future;
    emit(state.copyWith(status: NotificationStatus.connected));

    _connectionSub?.cancel();
    _notificationsSub?.cancel();
    _errorSub?.cancel();

    _connectionSub = _notificationService.connectionStream.listen((connected) {
      if (isClosed) return;
      emit(state.copyWith(
        status: connected
            ? NotificationStatus.connected
            : NotificationStatus.disconnected,
      ));
    });

    _notificationsSub =
        _notificationService.notificationsStream.listen((notifications) {
      if (isClosed) return;
      emit(state.copyWith(
        notifications: notifications,
        status: NotificationStatus.loaded,
      ));
    });

    _errorSub = _notificationService.errorStream.listen((err) {
      if (isClosed) return;
      emit(state.copyWith(
        status: err == 'Error updating notification'
            ? NotificationStatus.markedAsSeenError
            : NotificationStatus.connectionError,
        errorMessage: err,
      ));
    });
  }

  Future<void> loadNotifications() async {
    emit(state.copyWith(status: NotificationStatus.loading));
    const maxRetries = 3;
    var retries = 0;

    while (retries < maxRetries) {
      if (_notificationService.isConnected) {
        try {
          await _notificationService.getNotifications(AppConstants.kUserId);
          emit(state.copyWith(
            status: NotificationStatus.loaded,
            notifications: await _notificationService.notificationsStream.first,
          ));
          return;
        } catch (e) {
          if (isClosed) return;
          emit(state.copyWith(
            status: NotificationStatus.error,
            errorMessage: _getErrorMessage(e),
          ));
          log('Load notifications error: $e');
          return;
        }
      }
      retries++;
      await Future.delayed(const Duration(milliseconds: 500));
    }
    if (isClosed) return;

    emit(state.copyWith(
      status: NotificationStatus.error,
      errorMessage: 'Failed to connect after $maxRetries attempts',
    ));
  }

  Future<void> markAsSeen(String notificationId) async {
    try {
      await _notificationService.seenNotification(notificationId);
      //emit(state.copyWith(status: NotificationStatus.markedAsSeenSuccess));
    } catch (e) {
            if(isClosed) return;

      emit(state.copyWith(
        status: NotificationStatus.markedAsSeenError,
        errorMessage: _getErrorMessage(e),
      ));
      log('Mark as seen error: $e');
    }
  }

  String _getErrorMessage(dynamic error) {
    if (error is ServerFailure) {
      return error.errMessage;
    }
    return ServerFailure.fromError(error).errMessage;
  }

  Future<void> disconnect() async {
    _notificationService.disconnect();
    emit(state.copyWith(status: NotificationStatus.disconnected));
  }

  @override
  Future<void> close() {
    log('Closing NotificationCubit and disposing resources');
    _notificationsSub?.cancel();
    _connectionSub?.cancel();
    _errorSub?.cancel();
    _notificationService.dispose();
    return super.close();
  }
}
