import 'dart:convert';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatManager {
  List<types.Message> messages = [];
  final user = const types.User(
    id: 'user',
  );
  final bot = const types.User(id: 'model', firstName: 'Jaankar Sarthi');
  bool isLoading = false;
  late WebSocketChannel channel;

  void initializeWebsocket() {
    channel = IOWebSocketChannel.connect('ws://192.168.1.101:8000/ws');
    print('WebSocket connected'); // Add this line for debugging
  }

  void addMessage(types.Message message) {
    messages.insert(0, message);
    isLoading = true;
    if (message is types.TextMessage) {
      final jsonMessage = {
        'type': 'text',
        'text': message.text,
      };
      channel.sink.add(json.encode(jsonMessage));
      print(
          'Message sent to server: $jsonMessage'); // Add this line for debugging

      // Add a placeholder message while waiting for the response
      messages.insert(
        0,
        types.TextMessage(
          author: bot,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: const Uuid().v4(),
          text: "",
        ),
      );
    }
  }

  void onMessageReceived(response) {
    print(
        'Message received from server: $response'); // Add this line for debugging

    if (response == "<FIN>") {
      isLoading = false;
    } else {
      // Assuming response is a JSON string
      final Map<String, dynamic> jsonMessage = json.decode(response);
      final text = jsonMessage['text'] as String;

      messages.first = (messages.first as types.TextMessage).copyWith(
        text: (messages.first as types.TextMessage).text + text,
      );
    }
  }
}
