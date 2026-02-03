# Setup Guide for AI Explorer

This guide will help you set up and run the AI Explorer Flutter application.

## Step 1: Install Flutter

If you don't have Flutter installed:

1. Visit [flutter.dev](https://flutter.dev/docs/get-started/install)
2. Download and install Flutter for your operating system
3. Add Flutter to your PATH
4. Run `flutter doctor` to verify installation

## Step 2: Set Up Development Environment

### For Android Development
- Install Android Studio
- Install Android SDK (API level 21 or higher)
- Set up an Android emulator or connect a physical device

### For iOS Development (macOS only)
- Install Xcode from the Mac App Store
- Install Xcode command line tools
- Set up an iOS simulator or connect a physical device

## Step 3: Configure Firebase

### Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project" and follow the setup wizard
3. Give your project a name (e.g., "AI Explorer")

### Enable Firebase AI (Gemini API)

1. In your Firebase project, go to Build → Firebase AI
2. Enable the Gemini API
3. Note: You may need to enable billing for your Firebase project

### Configure Your Flutter App

#### Option 1: Using FlutterFire CLI (Recommended)

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Run the configuration command in your project directory
flutterfire configure
```

This will:
- Connect your Flutter app to your Firebase project
- Generate the `firebase_options.dart` file with your credentials
- Set up platform-specific configuration files

#### Option 2: Manual Configuration

If you prefer manual setup:

1. **For Android:**
   - Download `google-services.json` from Firebase Console
   - Place it in `android/app/`

2. **For iOS:**
   - Download `GoogleService-Info.plist` from Firebase Console
   - Add it to your Xcode project

3. **Update firebase_options.dart:**
   - Copy your API keys and project details from Firebase Console
   - Update the values in `lib/firebase_options.dart`

## Step 4: Install Dependencies

```bash
# Navigate to project directory
cd ai-explorer

# Get all packages
flutter pub get
```

## Step 5: Run the Application

```bash
# List available devices
flutter devices

# Run on connected device or emulator
flutter run

# Or run on a specific device
flutter run -d <device-id>
```

## Troubleshooting

### Common Issues

#### Firebase initialization fails
- Verify your `firebase_options.dart` has correct credentials
- Ensure Firebase AI is enabled in your Firebase project
- Check that your Firebase project has billing enabled (required for AI features)

#### Dependencies not resolving
```bash
flutter clean
flutter pub get
```

#### Build errors on Android
- Ensure Android SDK is properly installed
- Check that `minSdkVersion` is 21 or higher
- Run `flutter doctor` to diagnose issues

#### Build errors on iOS
- Run `pod install` in the `ios/` directory
- Open the project in Xcode and verify signing settings
- Ensure you have accepted Xcode license agreements

### Package Version Issues

If you encounter version conflicts with GenUI packages:

1. Check for the latest versions on pub.dev:
   - [genui](https://pub.dev/packages/genui)
   - [genui_firebase_ai](https://pub.dev/packages/genui_firebase_ai)

2. Update `pubspec.yaml` with compatible versions

3. Run:
   ```bash
   flutter pub upgrade
   ```

## Testing the App

### Run Unit/Widget Tests
```bash
flutter test
```

### Run in Debug Mode
```bash
flutter run --debug
```

### Run in Release Mode
```bash
flutter run --release
```

## Using the Application

### GenUI Chat Screen
1. Navigate to "GenUI Chat" from the home screen
2. Type a prompt like "Create a contact form"
3. The AI will generate appropriate UI components
4. Interact with the generated UI

### Examples Screen
1. Navigate to "Examples" from the home screen
2. Explore different use cases and example prompts
3. Learn about GenUI capabilities

## Important Notes

### Alpha Software Warning
- GenUI and Firebase AI integration are in alpha stage
- APIs may change without notice
- Not recommended for production applications yet
- Suitable for learning, prototyping, and experimentation

### API Costs
- Using Firebase AI (Gemini) may incur costs
- Monitor your Firebase usage dashboard
- Set up billing alerts in Google Cloud Console
- Consider usage limits during development

### Privacy and Security
- Never commit Firebase configuration files with real credentials to public repositories
- Use environment variables or secure storage for sensitive data
- Review Firebase security rules

## Next Steps

After setup, you can:
- Customize the widget catalog in the GenUI chat screen
- Add new example use cases
- Experiment with different AI prompts
- Extend the app with custom widgets
- Integrate additional Firebase services

## Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase Documentation](https://firebase.google.com/docs)
- [GenUI Documentation](https://docs.flutter.dev/ai/genui)
- [FlutterFire Documentation](https://firebase.flutter.dev/)
- [GenUI GitHub Repository](https://github.com/flutter/genui)

## Getting Help

If you encounter issues:
1. Check the troubleshooting section above
2. Review the error messages carefully
3. Search for similar issues on Stack Overflow
4. Check the GenUI GitHub repository for known issues
5. Ask for help in Flutter and Firebase communities

## Contributing

If you'd like to contribute improvements to this setup guide or the project:
1. Fork the repository
2. Make your changes
3. Submit a pull request with a clear description

---

Happy coding with GenUI and Flutter! 🚀
