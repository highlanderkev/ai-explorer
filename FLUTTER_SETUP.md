# Flutter Project Setup

This document describes the Flutter project setup for the AI Explorer application.

## Project Structure

The project has been configured with the following structure:

```
ai-explorer/
├── lib/
│   └── main.dart              # Main application entry point
├── test/
│   └── widget_test.dart       # Sample widget tests
├── android/                   # Android platform configuration
│   ├── app/
│   │   ├── build.gradle       # Android app build configuration
│   │   └── src/
│   │       └── main/
│   │           ├── AndroidManifest.xml
│   │           └── kotlin/    # Kotlin source files
│   ├── build.gradle           # Android project build configuration
│   ├── gradle.properties      # Gradle properties
│   └── settings.gradle        # Gradle settings
├── ios/                       # iOS platform configuration
│   └── Runner/
│       ├── AppDelegate.swift  # iOS app delegate
│       ├── Info.plist         # iOS configuration
│       └── Assets.xcassets/   # iOS assets
├── web/                       # Web platform configuration
│   ├── index.html             # Web entry point
│   └── manifest.json          # Web app manifest
├── pubspec.yaml               # Flutter project configuration
├── analysis_options.yaml      # Dart analyzer configuration
└── README.md                  # Project documentation
```

## Configuration Files

### pubspec.yaml
This is the main configuration file for the Flutter project. It defines:
- Project metadata (name, description, version)
- Dart SDK version constraints
- Dependencies (Flutter SDK, cupertino_icons)
- Dev dependencies (flutter_test, flutter_lints)
- Flutter-specific configuration

### analysis_options.yaml
Configures the Dart analyzer with linting rules to ensure code quality:
- Uses flutter_lints package for standard Flutter linting rules
- Additional custom rules for const constructors and avoiding print statements

### lib/main.dart
The main entry point of the Flutter application featuring:
- A Material Design app with a custom theme
- A stateful home page with a counter
- Demonstrates Flutter's reactive programming model

### test/widget_test.dart
A sample widget test that demonstrates:
- How to write widget tests in Flutter
- Testing user interactions (button taps)
- Verifying UI state changes

## Platform Support

The project is configured to support multiple platforms:

### Android
- Minimum SDK: 21 (Android 5.0 Lollipop)
- Target SDK: 34 (Android 14)
- Kotlin support
- Gradle 7.3.0
- AndroidX and Jetifier enabled

### iOS
- Swift-based app delegate
- Support for iPhone and iPad orientations
- Asset catalog for app icons
- Info.plist with standard app configuration

### Web
- Progressive Web App (PWA) support
- Service worker for offline functionality
- Responsive design
- Web manifest for installability

## Getting Started

To use this Flutter project:

1. Install Flutter SDK (3.0.0 or higher):
   - Follow instructions at https://docs.flutter.dev/get-started/install

2. Verify Flutter installation:
   ```bash
   flutter doctor
   ```

3. Get project dependencies:
   ```bash
   flutter pub get
   ```

4. Run the application:
   ```bash
   flutter run
   ```

## Development Commands

- `flutter pub get` - Fetch dependencies
- `flutter pub upgrade` - Upgrade dependencies
- `flutter run` - Run on connected device/emulator
- `flutter run -d chrome` - Run on web browser
- `flutter test` - Run all tests
- `flutter analyze` - Analyze code for issues
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS app (macOS only)
- `flutter build web` - Build web app

## Next Steps

With this Flutter setup, you can:
1. Add new features in the `lib/` directory
2. Create additional pages and widgets
3. Add state management (Provider, Riverpod, Bloc, etc.)
4. Integrate APIs and backend services
5. Add more comprehensive tests
6. Customize the Android/iOS/Web configurations
7. Add assets (images, fonts) by updating pubspec.yaml

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Flutter Samples](https://flutter.github.io/samples/)
