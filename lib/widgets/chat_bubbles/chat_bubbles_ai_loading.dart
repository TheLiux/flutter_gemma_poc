import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'avatar.dart';

class ChatBubbleAiLoading extends StatelessWidget {
  const ChatBubbleAiLoading({super.key});

  static const _bubblePadding = EdgeInsets.all(12);
  static const _bubbleMargin = EdgeInsets.symmetric(vertical: 5, horizontal: 10);
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
            child: LoadingAnimationWidget.waveDots(color: textColor, size: 16),
          ),
        ),
      ],
    );
  }
}
