import 'dart:convert';

import 'package:web_socket_channel/status.dart' as ws_status;
import 'package:web_socket_channel/web_socket_channel.dart';

import '../utils/app_constants.dart';

class ChatService {
  final WebSocketChannel _channel;
  final String projectId;
  bool _isClosed = false;

  ChatService._(this._channel, this.projectId);

  factory ChatService.connect(String projectId) {
    try {
      final channel = WebSocketChannel.connect(
        Uri.parse(AppConstants.websocketUrl),
      );
      return ChatService._(channel, projectId);
    } catch (e) {
      throw WebSocketChannelException('Connection failed: $e');
    }
  }

  Stream<Map<String, dynamic>> get messageStream {
    return _channel.stream.handleError((error) {
      throw WebSocketChannelException('Connection error: $error');
    }).map((message) {
      try {
        return json.decode(message) as Map<String, dynamic>;
      } catch (e) {
        throw const FormatException('Invalid message format');
      }
    });
  }

  void sendMessage({
    required String message,
    required String freelancerId,
    required String companyId,
  }) {
    if (_isClosed) {
      throw WebSocketChannelException('Connection is closed');
    }

    try {
      final payload = {
        'event': 'sendMessage',
        'data': {
          'projectId': projectId,
          'freelancerId': freelancerId,
          'companyId': companyId,
          'senderId': AppConstants.kUserId,
          'message': message,
        }
      };
      _channel.sink.add(json.encode(payload));
    } catch (e) {
      throw WebSocketChannelException('Failed to send message: $e');
    }
  }

  void requestMessages() {
    if (_isClosed) {
      throw WebSocketChannelException('Connection is closed');
    }

    try {
      final payload = {
        'event': 'getMessages',
        'data': {
          'projectId': projectId,
          'userId': AppConstants.kUserId,
        }
      };
      _channel.sink.add(json.encode(payload));
    } catch (e) {
      throw WebSocketChannelException('Failed to request messages: $e');
    }
  }

  Future<void> close() async {
    if (!_isClosed) {
      _isClosed = true;
      try {
        await _channel.sink.close(ws_status.normalClosure);
      } catch (e) {
        throw WebSocketChannelException('Failed to close connection: $e');
      }
    }
  }
}
