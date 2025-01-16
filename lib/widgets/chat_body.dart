import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gemma_poc_2/engine.dart';
import 'package:flutter_gemma_poc_2/message.dart';
import 'chat_bubbles/chat_bubbles.dart';

class ChatBody extends HookConsumerWidget {
  final Engine engine;

  const ChatBody({super.key, required this.engine});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesNotifier = ref.watch(messagesProvider(engine).notifier);
    final messages = ref.watch(messagesProvider(engine));
    final textController = useTextEditingController();
    final scrollController = useScrollController();
    final isSending = useState(false);

    Future<void> sendMessage() async {
      if (textController.text.isNotEmpty) {
        final userMessage = textController.text;
        textController.clear();
        isSending.value = true;
        await messagesNotifier.sendMessage(userMessage);
        isSending.value = false;
      }
    }

    useEffect(() {
      if (messages.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (scrollController.hasClients) {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          }
        });
      }
      return null;
    }, [messages.length]);

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Align(
            alignment:
                messages.isNotEmpty ? Alignment.topCenter : Alignment.center,
            child: SingleChildScrollView(
              controller: scrollController,
              child: _buildMessagesBody(messages),
            ),
          ),
        ),
        _buildTextField(textController, sendMessage, isSending.value),
      ],
    );
  }

  Widget _buildMessagesBody(List<Message> messages) {
    if (messages.isEmpty) {
      return const Align(child: Text("Write a message"));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: messages.length,
          itemBuilder: (context, i) {
            final message = messages[i];
            if (message.isLoading) {
              return const ChatBubbleAiLoading();
            }
            return message.isUser
                ? ChatBubbleUser(message: message.content)
                : ChatBubbleAiStreaming(message: message.content);
          },
        ),
      ],
    );
  }

  Widget _buildTextField(
    TextEditingController textController,
    VoidCallback sendMessage,
    bool isSending,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: textController,
        minLines: 1,
        maxLines: 3,
        keyboardType: TextInputType.multiline,
        enabled: !isSending,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            onPressed: isSending ? null : () => sendMessage(),
            icon: const Icon(Icons.send),
          ),
        ),
      ),
    );
  }
}
