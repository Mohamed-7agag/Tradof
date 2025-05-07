import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../features/chat/data/model/chat_message_model.dart';
import '../../features/chat/presentation/logic/cubit/chat_cubit.dart';

enum WebSocketEvent {
  sendMessage,
  getMessages,
  newMessage,
  messageHistory,
}

extension WebSocketEventExtension on WebSocketEvent {
  String get name => toString().split('.').last;
}

class WebSocketService {
  WebSocketChannel? _channel;
  final _statusController = StreamController<ChatStatus>.broadcast();
  final _messageController = StreamController<ChatMessageModel>.broadcast();
  final _messagesHistoryController =
      StreamController<List<ChatMessageModel>>.broadcast();

  ChatStatus _currentStatus = ChatStatus.initial;
  int _retryAttempts = 0;

  Stream<ChatStatus> get statusStream => _statusController.stream;
  Stream<ChatMessageModel> get messageStream => _messageController.stream;
  Stream<List<ChatMessageModel>> get messagesHistoryStream =>
      _messagesHistoryController.stream;

  Future<void> connect() async {
    if (_currentStatus == ChatStatus.connected) return;

    _updateStatus(ChatStatus.connecting);

    try {
      _channel = IOWebSocketChannel.connect(
        Uri.parse('wss://tradofserver.azurewebsites.net:443'),
        pingInterval: const Duration(seconds: 5),
      );

      // Listen immediately to avoid unhandled stream errors
      _channel!.stream.listen(
        _handleIncomingMessage,
        onError: (error) {
          _onConnectionError();
        },
        onDone: _onConnectionClosed,
        cancelOnError: true,
      );

      _retryAttempts = 0;
      _updateStatus(ChatStatus.connected);
    } catch (e) {
      _onConnectionError();
      _updateStatus(ChatStatus.error);
      throw Exception('WebSocket connection failed: $e');
    }
  }

  void _onConnectionError() {
    _updateStatus(ChatStatus.error);
    _scheduleReconnect();
  }

  void _onConnectionClosed() {
    _updateStatus(ChatStatus.disconnected);
    _scheduleReconnect();
  }

  void _scheduleReconnect() {
    if (_retryAttempts >= 5) return;
    Future.delayed(Duration(seconds: 2 << _retryAttempts), () {
      _retryAttempts++;
      connect();
    });
  }

  Future<void> disconnect() async {
    await _channel?.sink.close();
    _channel = null;
    _updateStatus(ChatStatus.disconnected);
  }

  Future<void> sendMessage({
    required String projectId,
    required String freelancerId,
    required String companyId,
    required String senderId,
    required String message,
  }) async {
    if (_channel == null) throw Exception('WebSocket not connected');
    final payload = {
      'event': WebSocketEvent.sendMessage.name,
      'data': {
        'projectId': projectId,
        'freelancerId': freelancerId,
        'companyId': companyId,
        'senderId': senderId,
        'message': message,
      }
    };
    _channel!.sink.add(jsonEncode(payload));
  }

  Future<void> getMessages({
    required String projectId,
    required String userId,
  }) async {
    if (_channel == null) throw Exception('WebSocket not connected');
    final payload = {
      'event': WebSocketEvent.getMessages.name,
      'data': {
        'projectId': projectId,
        'userId': userId,
      }
    };
    _channel!.sink.add(jsonEncode(payload));
  }

  void _handleIncomingMessage(dynamic message) {
    final parsed = jsonDecode(message as String);
    switch (parsed['event']) {
      case 'newMessage':
        _messageController.add(ChatMessageModel.fromJson(parsed['data']));
        break;
      case 'messageHistory':
        final List<ChatMessageModel> history = (parsed['data'] as List)
            .map((e) => ChatMessageModel.fromJson(e))
            .toList();
        _messagesHistoryController.add(history);
        break;
    }
    _updateStatus(ChatStatus.connected);
  }

  void _updateStatus(ChatStatus status) {
    _currentStatus = status;
    _statusController.add(status);
  }

  void dispose() {
    disconnect();
    _statusController.close();
    _messageController.close();
    _messagesHistoryController.close();
  }
}
