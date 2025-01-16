import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final engineProvider = FutureProvider<Engine>((ref) async {
  // Change your model path here
  final modelAssetPath = 'models/gemma-2b-it-gpu-int4.bin';
  return Engine.init(modelAssetPath);
});

class Engine {
  static bool _isLoaded = false;
  static bool _isInitialized = false;

  Engine._();

  static Future<Engine> init(String path) async {
    await _initializeEngine(path);

    return Engine._();
  }

  Stream<String?> generateResponse(String prompt) async* {
    if (!_isLoaded) throw Exception('Model not loaded');
    if (!_isInitialized) throw Exception('Model not initialized');

    try {
      yield* FlutterGemmaPlugin.instance.getResponseAsync(prompt: prompt);
    } catch (e) {
      yield 'Error!';
    }
  }

  static Future<void> _initializeEngine(String modelPath) async {
    await FlutterGemmaPlugin.instance.loadAssetModel(fullPath: modelPath);
    _isLoaded = await FlutterGemmaPlugin.instance.isLoaded;

    await FlutterGemmaPlugin.instance.init(
      maxTokens: 2048,
      temperature: 0.5,
      topK: 40,
      randomSeed: 42,
    );
    _isInitialized = await FlutterGemmaPlugin.instance.isInitialized;
  }
}
