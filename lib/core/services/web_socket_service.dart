import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:socket_io_client/socket_io_client.dart' as io;
import '../../features/chat/data/model/chat_message_model.dart';

class WebSocketService {
  io.Socket? _socket;

  final _messageController = StreamController<ChatMessageModel>.broadcast();
  final _messagesListController = StreamController<List<ChatMessageModel>>.broadcast();
  final _connectionController = StreamController<bool>.broadcast();
  final _errorController = StreamController<String>.broadcast();

  Stream<ChatMessageModel> get messageStream => _messageController.stream;
  Stream<List<ChatMessageModel>> get messagesListStream => _messagesListController.stream;
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
        log('Socket connected successfully👌');
        _connectionController.add(true);
      })
      ..onDisconnect((_) {
        log('Socket disconnected😒');
        _connectionController.add(false);
      })
      ..on('newMessage', _handleIncomingMessage)
      ..on('getMessages', _handleMessagesList)
      ..on('messagesSeen', (data) {
        log('Messages seen: $data');
      })
      ..on('error', (data) {
        final msg = data is String ? data : data['message'] ?? data.toString();
        _errorController.add(msg);
        log('Socket error: $msg');
      });
  }

  void _handleIncomingMessage(dynamic data) {
    try {
      log('Handling incoming message: $data');
      final message = ChatMessageModel.fromJson(data);
      _messageController.add(message);
    } catch (e) {
      log('Error handling incoming message: $e');
    }
  }

  void _handleMessagesList(dynamic data) {
    try {
      final parsed = data is String ? jsonDecode(data) : data;
      final messages = (parsed as List)
          .map((item) => ChatMessageModel.fromJson(item))
          .toList();
      _messagesListController.add(messages);
      log('Handling messages list: $messages');
    } catch (e) {
      log('Error handling messages list: $e');
    }
  }

  Future<void> sendMessage({
    required int projectId,
    required String freelancerId,
    required String companyId,
    required String senderId,
    required String message,
  }) async {
    if (!isConnected) throw Exception('Socket not connected');
    final payload = {
      'projectId': projectId,
      'freelancerId': freelancerId,
      'companyId': companyId,
      'senderId': senderId,
      'message': message,
    };
    _socket!.emit('sendMessage', payload);
    log('Message sent: $payload');
  }

  Future<void> getMessages({
    required int projectId,
    required String userId,
  }) async {
    if (!isConnected) throw Exception('Socket not connected');
    final payload = {
      'projectId': projectId,
      'userId': userId,
    };
    _socket!.emit('getMessages', payload);
    log('Requesting messages for projectId: $projectId, userId: $userId');
  }

  void disconnect() {
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
    _connectionController.add(false);
  }

  void dispose() {
    disconnect();
    _messageController.close();
    _messagesListController.close();
    _connectionController.close();
    _errorController.close();
  }
}