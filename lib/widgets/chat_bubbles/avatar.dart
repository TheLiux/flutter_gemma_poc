import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final TextStyle textStyle;

  const Avatar({super.key, required this.backgroundColor, required this.textStyle, required this.text});


  @override
  Widget build(BuildContext context) {
    return CircleAvatar(backgroundColor: backgroundColor, child: Text(text, style: textStyle));
  }
}
