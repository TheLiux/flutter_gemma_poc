import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'engine.dart';

class Message {
  final String content;
  final bool isUser;
  final bool isLoading;

  Message({this.content = '', this.isUser = true, this.isLoading = false});
}

class MessagesNotifier extends StateNotifier<List<Message>> {
  final Engine engine;

  MessagesNotifier(this.engine) : super([]);

  Future<void> sendMessage(String userMessage) async {
    state = [...state, Message(content: userMessage, isUser: true)];

    final aiMessageIndex = state.length;
    state = [...state, Message(isUser: false, isLoading: true)];

    try {
      String currentResponse = '';
      final responseStream = engine.generateResponse(userMessage);

      await for (final chunk in responseStream) {
        if (chunk != null) {
          currentResponse += chunk;
          state = [...state.sublist(0, aiMessageIndex), Message(content: currentResponse, isUser: false)];
        }
      }
    } catch (e) {
      state = [
        ...state.sublist(0, aiMessageIndex),
        Message(content: 'Error generating response: ${e.toString()}', isUser: false),
      ];
    }
  }
}

final messagesProvider = StateNotifierProvider.family<MessagesNotifier, List<Message>, Engine>(
  (ref, engine) => MessagesNotifier(engine),
);
