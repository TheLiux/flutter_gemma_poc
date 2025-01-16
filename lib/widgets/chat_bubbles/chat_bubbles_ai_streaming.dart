import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';

import 'avatar.dart';

class ChatBubbleAiStreaming extends StatelessWidget {
  final String message;

  const ChatBubbleAiStreaming({super.key, required this.message});

  static const _bubblePadding = EdgeInsets.all(12);
  static const _bubbleMargin = EdgeInsets.symmetric(vertical: 5, horizontal: 10);
  static const _timestampStyle = TextStyle(fontSize: 10);
  static const _botBubbleRadius = BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
    bottomLeft: Radius.circular(0),
    bottomRight: Radius.circular(15),
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = colorScheme.secondaryContainer;
    final textColor = colorScheme.onSecondaryContainer;
    final currentTime = DateFormat('HH:mm').format(DateTime.now());

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Avatar(
          text: 'AI',
          backgroundColor: colorScheme.secondaryContainer,
          textStyle: TextStyle(color: colorScheme.onSecondaryContainer),
        ),
        Flexible(
          child: Container(
            margin: _bubbleMargin,
            padding: _bubblePadding,
            decoration: BoxDecoration(color: backgroundColor, borderRadius: _botBubbleRadius),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                MarkdownBody(data: message, styleSheet: MarkdownStyleSheet(p: TextStyle(color: textColor))),
                const SizedBox(height: 4),
                Text(currentTime, style: _timestampStyle.copyWith(color: textColor.withOpacity(0.7))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
