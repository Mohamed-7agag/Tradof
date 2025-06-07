import 'dart:async';
import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../features/notification/data/model/notification_model.dart';

class NotificationService {
  io.Socket? _socket;

  final _notificationsController =
      StreamController<List<NotificationModel>>.broadcast();
  final _connectionController = StreamController<bool>.broadcast();
  final _errorController = StreamController<String>.broadcast();

  Stream<List<NotificationModel>> get notificationsStream =>
      _notificationsController.stream;
  Stream<bool> get connectionStream => _connectionController.stream;
  Stream<String> get errorStream => _errorController.stream;

  bool get isConnected => _socket?.connected ?? false;

  Future<void> connect() async {
    if (isConnected) return;

    try {
      _socket = io.io(
        'https://tradofapi-production.up.railway.app',
        io.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build(),
      );
      _setupEventListeners();
      _socket!.connect();
    } catch (e) {
      log('Socket connection failed: $e');
      _errorController.add('Socket connection failed: $e');
    }
  }

  void _setupEventListeners() {
    _socket!
      ..onConnect((_) {
        log('Notification Socket connected');
        _connectionController.add(true);
      })
      ..onDisconnect((_) {
        log('Notification Socket disconnected');
        _connectionController.add(false);
      })
      ..on('notificationsList', _handleNotifications)
      ..on('notificationSeen', _handleNotificationSeen)
      ..on('error', (data) {
        final msg = data['message'] ;
        _errorController.add(msg);
        log('Socket error: $msg');
      });
  }

  void _handleNotifications(dynamic data) {
    try {
      final notifications = data['notifications']
          .map<NotificationModel>(
            (item) => NotificationModel.fromJson(item),
          )
          .toList();
      _notificationsController.add(notifications);
    } catch (e) {
      log('Error handling notifications: $e');
    }
  }

  void _handleNotificationSeen(dynamic data) {
    try {      
      log('Notification seen: $data');
    } catch (e) {
      log('Error handling notification seen: $e');
    }
  }

  Future<void> getNotifications(String userId) async {
    if (!isConnected) throw Exception('Socket not connected');
    _socket!.emit('getNotifications', {'userId': userId});
    log('Requesting notifications for userId: $userId');
  }

  Future<void> seenNotification(String notificationId) async {
    if (!isConnected) throw Exception('Socket not connected');
    _socket!.emit('seenNotification', notificationId);
  }

  void disconnect() {
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
    _connectionController.add(false);
  }

  void dispose() {
    disconnect();
    _notificationsController.close();
    _connectionController.close();
    _errorController.close();
  }
}
