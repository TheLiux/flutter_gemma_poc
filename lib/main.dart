import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_gemma_poc_2/theme/theme.dart';
import 'package:flutter_gemma_poc_2/widgets/chat_body.dart';

import 'engine.dart';

void main() async {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    final theme = AppTheme();
    return MaterialApp(
      title: 'Flutter Gemma',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const HomePage(title: 'Chatbot'),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final $engine = ref.watch(engineProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: $engine.when(
            data: (engine) {
              return ChatBody(engine: engine);
            },
            error: (e, s) => Text('Error'),
            loading:
                () => LoadingAnimationWidget.waveDots(
                  color: Theme.of(context).colorScheme.primary,
                  size: 48,
                ),
          ),
        ),
      ),
    );
  }
}
