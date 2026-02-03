# Firebase Configuration Example

This file provides an example of how to configure Firebase for the AI Explorer app.

## Getting Your Firebase Configuration

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Click on the gear icon (Project Settings)
4. Scroll down to "Your apps"
5. Select or add your platform (Android/iOS/Web)
6. Copy the configuration values

## Configuration Values

You'll need these values for `lib/firebase_options.dart`:

```dart
// For Web
static const FirebaseOptions web = FirebaseOptions(
  apiKey: 'AIza...',              // From Firebase Console
  appId: '1:123...:web:abc...',   // From Firebase Console
  messagingSenderId: '123...',     // From Firebase Console
  projectId: 'your-project-id',    // Your Firebase project ID
  authDomain: 'your-project-id.firebaseapp.com',
  storageBucket: 'your-project-id.appspot.com',
);

// For Android
static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'AIza...',              // From Firebase Console (Android)
  appId: '1:123...:android:abc...', // From Firebase Console
  messagingSenderId: '123...',     // Same as above
  projectId: 'your-project-id',    // Same as above
  storageBucket: 'your-project-id.appspot.com',
);

// For iOS
static const FirebaseOptions ios = FirebaseOptions(
  apiKey: 'AIza...',              // From Firebase Console (iOS)
  appId: '1:123...:ios:abc...',   // From Firebase Console
  messagingSenderId: '123...',     // Same as above
  projectId: 'your-project-id',    // Same as above
  storageBucket: 'your-project-id.appspot.com',
  iosBundleId: 'com.example.aiExplorer', // Your app bundle ID
);
```

## Using FlutterFire CLI (Recommended)

Instead of manual configuration, use the FlutterFire CLI:

```bash
# Install the CLI
dart pub global activate flutterfire_cli

# Configure your app
flutterfire configure
```

This will automatically:
- Detect your Firebase projects
- Generate the `firebase_options.dart` file
- Set up platform-specific configuration

## Enabling Firebase AI

1. In Firebase Console, go to **Build** → **Firebase AI**
2. Click **Get Started** or **Enable**
3. Follow the setup wizard
4. Enable the Gemini API
5. Configure billing (required for AI features)

## Security Notes

⚠️ **Important:**
- Never commit real Firebase credentials to public repositories
- Use environment variables for sensitive data
- Keep your API keys secure
- Regularly rotate credentials
- Set up Firebase security rules

## Testing Without Firebase

If you want to test the app structure without Firebase:
- The app includes error handling for Firebase initialization
- UI components will load even if Firebase fails
- Some features will show mock data or error messages

## Additional Configuration Files

### Android (google-services.json)
If not using FlutterFire CLI, place this file in:
```
android/app/google-services.json
```

### iOS (GoogleService-Info.plist)
If not using FlutterFire CLI, add this file to:
```
ios/Runner/GoogleService-Info.plist
```

## Verifying Configuration

After configuration, verify it works:

```bash
flutter run
```

Look for console output indicating successful Firebase initialization.

## Troubleshooting

### "Firebase not initialized" error
- Check that `firebase_options.dart` exists
- Verify all configuration values are correct
- Ensure Firebase AI is enabled in your project

### "Billing not enabled" error
- Firebase AI requires billing to be enabled
- Set up billing in Firebase Console
- Consider setting budget alerts

### Package version conflicts
- Check for latest compatible versions
- Run `flutter pub upgrade`
- Clear cache with `flutter clean`

## Resources

- [Firebase Console](https://console.firebase.google.com/)
- [FlutterFire Documentation](https://firebase.flutter.dev/)
- [Firebase AI Documentation](https://firebase.google.com/docs/ai)
