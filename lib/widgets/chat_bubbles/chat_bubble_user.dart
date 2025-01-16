import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'avatar.dart';

class ChatBubbleUser extends StatelessWidget {
  final String message;

  const ChatBubbleUser({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = colorScheme.primaryContainer;
    final textColor = colorScheme.onPrimaryContainer;
    final currentTime = DateFormat('HH:mm').format(DateTime.now());

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            margin: _bubbleMargin,
            padding: _bubblePadding,
            decoration: BoxDecoration(color: backgroundColor, borderRadius: _userBubbleRadius),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(message, style: TextStyle(color: textColor)),
                const SizedBox(height: 4),
                Text(currentTime, style: _timestampStyle.copyWith(color: textColor.withOpacity(0.7))),
              ],
            ),
          ),
        ),
        Avatar(
          backgroundColor: colorScheme.primaryContainer,
          text: 'US',
          textStyle: TextStyle(color: colorScheme.onPrimaryContainer),
        ),
      ],
    );
  }

  static const _bubblePadding = EdgeInsets.all(12);
  static const _bubbleMargin = EdgeInsets.symmetric(vertical: 5, horizontal: 10);
  static const _timestampStyle = TextStyle(fontSize: 10);
  static const _userBubbleRadius = BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
    bottomLeft: Radius.circular(15),
    bottomRight: Radius.circular(0),
  );
}
