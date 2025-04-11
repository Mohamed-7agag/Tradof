import 'package:web_socket_channel/web_socket_channel.dart';

class ChatService {
  final WebSocketChannel _channel;

  ChatService._(this._channel);

  factory ChatService.connect(String url) {
    final channel = WebSocketChannel.connect(Uri.parse(url));
    return ChatService._(channel);
  }

  Stream<String> get messageStream => _channel.stream.cast<String>();

  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  Future<void> close() async {
    await _channel.sink.close();
  }
}