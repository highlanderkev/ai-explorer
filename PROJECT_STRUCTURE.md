# Project Structure Overview

This document provides a complete overview of the AI Explorer project structure.

## Directory Structure

```
ai-explorer/
├── android/                          # Android platform-specific files
│   ├── app/
│   │   ├── src/main/
│   │   │   ├── kotlin/              # Kotlin source files
│   │   │   │   └── com/example/ai_explorer/
│   │   │   │       └── MainActivity.kt
│   │   │   └── AndroidManifest.xml  # Android manifest
│   │   └── build.gradle             # App-level Gradle config
│   ├── build.gradle                  # Project-level Gradle config
│   └── settings.gradle               # Gradle settings
│
├── ios/                              # iOS platform-specific files
│   └── Runner/
│       ├── AppDelegate.swift         # iOS app delegate
│       └── Info.plist                # iOS configuration
│
├── lib/                              # Main Flutter application code
│   ├── screens/                      # UI screens
│   │   ├── home_screen.dart          # Main navigation screen
│   │   ├── genui_chat_screen.dart    # GenUI chat interface
│   │   └── examples_screen.dart      # Examples showcase
│   ├── main.dart                     # App entry point
│   └── firebase_options.dart         # Firebase configuration
│
├── test/                             # Test files
│   └── widget_test.dart              # Widget tests
│
├── .gitignore                        # Git ignore rules
├── .metadata                         # Project metadata
├── analysis_options.yaml             # Dart analyzer configuration
├── pubspec.yaml                      # Package dependencies
│
└── Documentation Files
    ├── README.md                     # Project overview
    ├── SETUP.md                      # Setup instructions
    ├── USAGE.md                      # Usage guide
    ├── CONTRIBUTING.md               # Contribution guidelines
    ├── FIREBASE_CONFIG.md            # Firebase setup
    ├── CHANGELOG.md                  # Version history
    └── LICENSE                       # MIT License
```

## File Descriptions

### Core Application Files

#### `lib/main.dart`
- App entry point
- Firebase initialization
- Material app configuration
- Theme setup

#### `lib/firebase_options.dart`
- Firebase platform configurations
- API keys and project IDs (template)
- Platform-specific options

#### `lib/screens/home_screen.dart`
- Main navigation screen
- Feature cards (GenUI Chat, Examples)
- Material Design 3 UI

#### `lib/screens/genui_chat_screen.dart`
- Interactive chat interface
- GenUI manager setup
- Firebase AI content generator
- Message handling
- Dynamic UI rendering area

#### `lib/screens/examples_screen.dart`
- Example use cases showcase
- Expandable cards with details
- Usage patterns
- How-to information

### Configuration Files

#### `pubspec.yaml`
- Package dependencies
- GenUI and Firebase AI packages
- SDK version constraints
- Asset declarations

#### `analysis_options.yaml`
- Dart linting rules
- Code style preferences
- Analysis configuration

#### `android/app/build.gradle`
- Android app configuration
- Compile and target SDK versions
- Application ID and versioning

#### `android/settings.gradle`
- Gradle plugin management
- Flutter plugin loader
- Repository configuration

#### `ios/Runner/Info.plist`
- iOS app configuration
- Bundle identifier
- Display name and permissions

### Test Files

#### `test/widget_test.dart`
- Widget tests for navigation
- Basic functionality tests
- Screen loading verification

### Documentation Files

#### `README.md`
Main project documentation covering:
- Features overview
- What is GenUI
- Getting started guide
- Installation instructions
- Project structure
- Dependencies
- Use cases

#### `SETUP.md`
Detailed setup instructions including:
- Flutter installation
- Development environment setup
- Firebase configuration steps
- Troubleshooting guide
- Testing procedures

#### `USAGE.md`
Comprehensive usage guide with:
- Key concepts explanation
- Example prompts
- Advanced usage patterns
- Best practices
- Troubleshooting
- Performance tips

#### `CONTRIBUTING.md`
Contribution guidelines covering:
- Code of conduct
- Development setup
- Coding standards
- Testing requirements
- Pull request process
- Commit message format

#### `FIREBASE_CONFIG.md`
Firebase-specific configuration:
- Getting credentials
- Platform setup
- FlutterFire CLI usage
- Security notes
- Testing without Firebase

#### `CHANGELOG.md`
Version history and changes:
- Current features
- Planned features
- Version roadmap
- Known limitations

## Component Architecture

### GenUI Integration

```
User Input
    ↓
GenUI Chat Screen
    ↓
GenUI Manager (Widget Catalog)
    ↓
Firebase AI Content Generator (Gemini)
    ↓
Dynamic UI Components
    ↓
Rendered Interface
```

### Data Flow

```
1. User enters prompt
2. Message sent to GenUI Conversation
3. Firebase AI processes request
4. Gemini generates UI structure
5. GenUI Manager validates components
6. Widgets rendered to screen
7. User interacts with generated UI
8. Updates sent back to AI
```

## Key Technologies

### Flutter Framework
- **Version**: 3.0.0+
- **Language**: Dart 3.0.0+
- **UI**: Material Design 3

### GenUI SDK
- **Package**: genui ^0.1.0
- **Status**: Alpha/Experimental
- **Purpose**: Dynamic UI generation

### Firebase AI
- **Package**: genui_firebase_ai ^0.1.0
- **Model**: Google Gemini
- **Purpose**: AI-powered content generation

### Firebase Core
- **Package**: firebase_core ^3.11.0
- **Purpose**: Firebase initialization and services

## Feature Breakdown

### Home Screen Features
- Navigation cards
- Material Design 3 theme
- Responsive layout
- Clean, modern UI

### GenUI Chat Features
- Real-time chat interface
- Message history
- AI response handling
- Error display
- Firebase integration
- Dynamic UI rendering area

### Examples Screen Features
- Expandable cards
- Multiple categories
- Usage examples
- Implementation details
- Informational content

## Development Workflow

1. **Setup**: Install Flutter, configure Firebase
2. **Development**: Edit Dart files in `lib/`
3. **Testing**: Run `flutter test`
4. **Building**: Run `flutter build`
5. **Deployment**: Platform-specific deployment

## Build Artifacts (Not in Repository)

These directories are generated during build and excluded via `.gitignore`:
- `build/` - Build output
- `.dart_tool/` - Dart tooling
- `.flutter-plugins` - Flutter plugins
- `.flutter-plugins-dependencies` - Plugin dependencies
- `android/.gradle/` - Gradle cache
- `ios/Pods/` - CocoaPods dependencies

## Environment-Specific Files

Files that should be customized per environment:
- `lib/firebase_options.dart` - Firebase credentials
- `android/app/google-services.json` - Android Firebase config (not in repo)
- `ios/Runner/GoogleService-Info.plist` - iOS Firebase config (not in repo)

## Code Organization Principles

### Single Responsibility
Each file has a clear, focused purpose

### Separation of Concerns
- Screens handle UI
- Services handle business logic
- Configuration is separate

### Reusability
- Widget extraction for common patterns
- Shared utilities
- Modular structure

### Testability
- Widget tests for UI
- Unit tests for logic
- Integration tests for flows

## Future Structure Additions

Planned additions to the project structure:

```
lib/
├── models/          # Data models
├── services/        # Business logic
├── widgets/         # Reusable widgets
├── utils/           # Utility functions
├── constants/       # App constants
└── providers/       # State management
```

## Maintenance Notes

### Regular Updates
- Update dependencies in `pubspec.yaml`
- Keep Flutter SDK current
- Monitor GenUI package updates
- Update documentation

### Security
- Rotate Firebase credentials
- Review security rules
- Update dependencies for security patches
- Audit third-party packages

### Performance
- Monitor app size
- Optimize widget rebuilds
- Profile AI request latency
- Reduce network calls

## Resources and References

- [Flutter Documentation](https://flutter.dev/docs)
- [GenUI Repository](https://github.com/flutter/genui)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

## Questions?

For questions about the project structure:
- Check the documentation files
- Review inline code comments
- Open a GitHub issue
- Consult the Flutter community

---

Last Updated: 2024
Version: 1.0.0
Status: Active Development
