# flutter_gemma_poc

<video controls src="assets/readme_video.mp4" title="Title"></video>

## Requirements

- Download the latest version of [Flutter](https://docs.flutter.dev/get-started/install)

## Getting Started
- Download a model from [Kaggle](https://www.kaggle.com/models/google/gemma/tfLite), preferably a 2B model for low-end devices (For web, use only a GPU model. CPU models doesn't work right now, due to incompatibility with Mediapipe)
- Add it to the assets/model folder and do `flutter pub get`
- Change your model path if differ from the model you picked on [engine.dart](lib/engine.dart)
- Run the app!
