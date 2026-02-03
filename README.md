# AI Explorer

A Flutter application showcasing the power of Generative AI using GenUI and Firebase AI SDK. This project demonstrates how to build dynamic, AI-driven user interfaces that adapt in real-time to user needs.

## Features

- 🤖 **GenUI Integration**: Dynamic UI generation powered by Google's Gemini AI
- 🔥 **Firebase AI**: Secure and scalable AI model integration
- 💬 **Interactive Chat**: Conversational interface for UI generation
- 📱 **Material Design 3**: Modern and responsive UI
- 🎨 **Custom Widget Catalog**: Extensible component library for AI-driven UIs

## What is GenUI?

GenUI is an experimental SDK from the Flutter team that enables AI models (like Google's Gemini) to dynamically generate and update user interfaces at runtime. Instead of hardcoding UI layouts, GenUI allows an AI to:

- Compose UI components on the fly based on user intent
- Create forms, cards, carousels, and interactive elements dynamically
- Adapt interfaces in real-time to conversation context
- Turn chatbot interactions into rich, interactive experiences

## Screenshots

The app includes:
- **Home Screen**: Navigation to different GenUI features
- **GenUI Chat**: Interactive chat interface where AI generates UIs
- **Examples**: Showcase of various GenUI capabilities and use cases

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Firebase project with Firebase AI enabled
- Android Studio / Xcode for mobile development

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/highlanderkev/ai-explorer.git
   cd ai-explorer
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Firebase AI (Gemini API) in your project
   - Run the FlutterFire CLI to configure your app:
     ```bash
     flutterfire configure
     ```
   - This will update the `lib/firebase_options.dart` file with your project's configuration

4. **Run the app**
   ```bash
   flutter run
   ```

### Firebase Configuration

To use Firebase AI features, you need to:

1. Set up a Firebase project
2. Enable the Gemini API in Firebase AI
3. Configure your Flutter app with Firebase credentials
4. Update `lib/firebase_options.dart` with your project details

For detailed instructions, visit:
- [Firebase Console](https://console.firebase.google.com/)
- [FlutterFire Documentation](https://firebase.flutter.dev/)
- [Firebase AI Setup Guide](https://firebase.google.com/docs/ai)

## Project Structure

```
lib/
├── main.dart                          # App entry point
├── firebase_options.dart              # Firebase configuration
└── screens/
    ├── home_screen.dart               # Main navigation screen
    ├── genui_chat_screen.dart         # GenUI chat interface
    └── examples_screen.dart           # Examples and documentation
```

## How It Works

1. **Widget Catalog**: The app defines a catalog of Flutter widgets that the AI can use
2. **AI Content Generator**: Firebase AI (Gemini) receives user prompts and decides which UI components to generate
3. **Dynamic Rendering**: GenUI Manager processes the AI's decisions and renders the appropriate widgets
4. **Real-time Updates**: As users interact with the generated UI, changes are communicated back to the AI

## Example Use Cases

- **Dynamic Forms**: Generate contact forms, surveys, and data entry interfaces
- **Product Browsing**: Create product cards and shopping interfaces
- **Travel Booking**: Build flight/hotel booking forms with date pickers and selectors
- **Data Visualization**: Generate charts and dashboards
- **Interactive Cards**: Create information cards and status displays

## Dependencies

Key packages used in this project:

- `genui`: Core GenUI SDK for dynamic UI generation
- `genui_firebase_ai`: Firebase AI integration for GenUI
- `firebase_core`: Firebase core functionality
- `firebase_ai`: Firebase AI services

## Development Notes

### Alpha Status

Both GenUI and Firebase AI integration are in **alpha/experimental** stage. APIs may change rapidly. This project is suitable for:
- Learning and experimentation
- Prototyping new concepts
- Building internal tools
- Exploring AI-driven UIs

### Best Practices

- Always include error handling for AI-generated UIs
- Validate AI outputs before rendering
- Use the catalog system to constrain what the AI can generate
- Test thoroughly as AI outputs can be unpredictable
- Monitor token usage and API costs

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Resources

- [GenUI Package on pub.dev](https://pub.dev/packages/genui)
- [GenUI Firebase AI on pub.dev](https://pub.dev/packages/genui_firebase_ai)
- Flutter GenUI Documentation (coming soon)
- [Firebase AI Documentation](https://firebase.google.com/docs/ai)
- GenUI GitHub Repository (planned; open-sourcing in progress)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter team for the GenUI SDK
- Google for Firebase AI and Gemini integration
- The Flutter community for support and feedback