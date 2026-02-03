# Quick Start Guide

Get up and running with AI Explorer in 5 minutes!

## Prerequisites Checklist

- [ ] Flutter SDK installed (3.0.0+)
- [ ] IDE (VS Code or Android Studio)
- [ ] Git installed
- [ ] Firebase account created

## Quick Setup (5 Steps)

### 1. Clone and Install (1 min)

```bash
git clone https://github.com/highlanderkev/ai-explorer.git
cd ai-explorer
flutter pub get
```

### 2. Configure Firebase (2 min)

**Option A: FlutterFire CLI (Recommended)**
```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

**Option B: Manual**
- Go to [Firebase Console](https://console.firebase.google.com/)
- Create/select project
- Enable Firebase AI
- Download config files
- Update `lib/firebase_options.dart`

### 3. Enable Firebase AI (1 min)

1. Open [Firebase Console](https://console.firebase.google.com/)
2. Navigate to **Build** → **Firebase AI**
3. Click **Enable**
4. Enable billing if required

### 4. Run the App (1 min)

```bash
# Check available devices
flutter devices

# Run on device/emulator
flutter run
```

### 5. Explore Features

1. Launch app
2. Tap **GenUI Chat**
3. Try: "Create a contact form"
4. See the magic happen! ✨

## First Steps in the App

### Try These Prompts

**Easy:**
```
"Show me a simple card"
"Create a button"
```

**Medium:**
```
"Create a contact form with name and email"
"Show a product card with image and price"
```

**Advanced:**
```
"Build a flight booking interface with date pickers"
"Create a dashboard with statistics cards"
```

## Troubleshooting

### Flutter not found
```bash
# Add to PATH (Unix/Linux/Mac)
export PATH="$PATH:/path/to/flutter/bin"

# Verify
flutter doctor
```

### Dependencies won't install
```bash
flutter clean
flutter pub get
```

### Firebase errors
- Check `firebase_options.dart` has your credentials
- Verify Firebase AI is enabled
- Ensure billing is configured

### App won't run
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run
```

## Next Steps

✅ **You're Done!** The app is running.

**To Learn More:**
- Read [README.md](README.md) for features overview
- Check [USAGE.md](USAGE.md) for advanced usage
- Review [SETUP.md](SETUP.md) for detailed setup

**To Customize:**
- Modify widget catalog in `lib/screens/genui_chat_screen.dart`
- Adjust system instruction for AI behavior
- Add custom examples in `lib/screens/examples_screen.dart`

**To Contribute:**
- Read [CONTRIBUTING.md](CONTRIBUTING.md)
- Fork the repository
- Make your changes
- Submit a pull request

## Common Commands

```bash
# Run app
flutter run

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
dart format .

# Update dependencies
flutter pub upgrade

# Clean build
flutter clean

# Build for release
flutter build apk      # Android
flutter build ios      # iOS
```

## IDE Setup

### VS Code
1. Install Flutter extension
2. Open project folder
3. Press F5 to run

### Android Studio
1. Install Flutter plugin
2. Open project
3. Click Run button

## Project Structure Quick Reference

```
lib/
├── main.dart                    # App entry point
├── screens/
│   ├── home_screen.dart         # Home screen
│   ├── genui_chat_screen.dart   # Chat interface
│   └── examples_screen.dart     # Examples
└── firebase_options.dart        # Firebase config
```

## Resources

- [Flutter Docs](https://flutter.dev/docs)
- [GenUI Docs](https://docs.flutter.dev/ai/genui)
- [Firebase Docs](https://firebase.google.com/docs)

## Getting Help

- **Documentation**: Start with README.md
- **Issues**: [GitHub Issues](https://github.com/highlanderkev/ai-explorer/issues)
- **Community**: Flutter Discord, Reddit

## Development Tips

### Hot Reload
- Press `r` in terminal while app is running
- Or use IDE hot reload button
- Instantly see code changes

### Debug Mode
```bash
flutter run --debug
```

### Release Mode
```bash
flutter run --release
```

### Specific Device
```bash
flutter run -d <device-id>
```

## What's Next?

🎯 **Try building something:**
1. Ask AI to create a custom form
2. Modify the widget catalog
3. Add a new example
4. Create custom widgets

🚀 **Share your experience:**
- Star the repo on GitHub
- Share with the Flutter community
- Contribute improvements

💡 **Learn more:**
- Experiment with different prompts
- Read the full documentation
- Join Flutter community discussions

---

**Need help?** Open an issue on GitHub or check the documentation!

**Ready to contribute?** Read CONTRIBUTING.md to get started!

Happy coding! 🎉
