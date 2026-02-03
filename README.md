# AI Explorer

An AI exploration Flutter application.

## Getting Started

This project is a Flutter application. To run this application, you need to have Flutter SDK installed on your machine.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.0.0 or higher)
- Dart SDK (comes with Flutter)

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/highlanderkev/ai-explorer.git
   cd ai-explorer
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

### Available Commands

- `flutter pub get` - Install dependencies
- `flutter run` - Run the application on a connected device/emulator
- `flutter test` - Run the test suite
- `flutter build web` - Build for web deployment
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS application (macOS only)
- `flutter analyze` - Analyze the Dart code for issues

### Project Structure

```
ai-explorer/
├── android/          # Android-specific code and configuration
├── ios/              # iOS-specific code and configuration
├── lib/              # Dart source code
│   └── main.dart     # Application entry point
├── test/             # Test files
├── web/              # Web-specific code and configuration
└── pubspec.yaml      # Project dependencies and configuration
```

## Development

This application uses Flutter's Material Design components and follows Flutter best practices.

### Running on Different Platforms

- **Web**: `flutter run -d chrome`
- **Android**: `flutter run -d android`
- **iOS**: `flutter run -d ios` (requires macOS)

## License

See the [LICENSE](LICENSE) file for details.