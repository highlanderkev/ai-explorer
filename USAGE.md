# AI Explorer Usage Guide

This guide provides detailed examples and usage patterns for the AI Explorer application.

## Overview

AI Explorer showcases the capabilities of GenUI (Generative UI) and Firebase AI to create dynamic, AI-driven user interfaces in Flutter.

## Key Concepts

### GenUI
GenUI allows AI models to dynamically generate and compose UI components at runtime, rather than using hardcoded layouts.

### Widget Catalog
A catalog defines which Flutter widgets the AI can use. Think of it as giving the AI a toolbox of UI components.

### Content Generator
The AI (powered by Gemini via Firebase) that decides which widgets to use and how to arrange them based on user prompts.

## Using the App

### Home Screen

The home screen provides two main options:

1. **GenUI Chat** - Interactive chat interface where you can request UI generation
2. **Examples** - Browse various use cases and capabilities

### GenUI Chat Screen

This screen demonstrates real-time, conversational UI generation.

#### Example Prompts

**Creating Forms:**
```
"Create a contact form with name, email, and message fields"
"Make a registration form with username, password, and email"
"Build a survey form with rating scales and text inputs"
```

**Product Displays:**
```
"Show me a product card for a smartphone"
"Create a product carousel with multiple items"
"Display a product grid with images and prices"
```

**Travel Booking:**
```
"Create a flight booking interface"
"Make a hotel reservation form with date pickers"
"Build a travel search with departure and destination"
```

**Data Visualization:**
```
"Show sales data with a chart"
"Create a dashboard with status cards"
"Display analytics with graphs and metrics"
```

**Interactive Elements:**
```
"Add a slider for price range selection"
"Create a rating widget with stars"
"Make a checkbox list for preferences"
```

### Examples Screen

Browse pre-defined examples organized by category:

- **Dynamic Form Generation** - Various input forms
- **Product Browsing** - E-commerce interfaces
- **Travel Booking** - Reservation systems
- **Data Visualization** - Charts and dashboards
- **Interactive Cards** - Information displays

## Advanced Usage

### Customizing the Widget Catalog

You can extend the widget catalog with custom components:

```dart
// In genui_chat_screen.dart
final catalog = CoreCatalogItems.asCatalog().copyWith([
  // Add your custom catalog items here
  CustomWidget.catalogItem,
]);
```

### System Instructions

Customize how the AI behaves by modifying the system instruction:

```dart
systemInstruction: '''
You are a helpful AI assistant specialized in [your domain].
Create interfaces that are [your requirements].
Focus on [your priorities].
''',
```

### Handling AI Responses

The app includes error handling for:
- Firebase initialization failures
- Network connectivity issues
- Invalid AI responses
- API rate limits

## Best Practices

### Effective Prompts

**Be Specific:**
- ❌ "Create a form"
- ✅ "Create a contact form with name, email, phone, and message fields"

**Provide Context:**
- ❌ "Make a product page"
- ✅ "Create a product detail page for a laptop with specs, images, and purchase button"

**Include Constraints:**
- ✅ "Create a compact card that fits in a list"
- ✅ "Build a responsive layout that works on mobile"

### Performance Tips

1. **Start Simple** - Begin with basic requests and add complexity
2. **Cache Responses** - Store frequently used UI patterns
3. **Limit Requests** - Be mindful of API costs
4. **Progressive Enhancement** - Build core UI first, enhance with AI

### Error Handling

The app gracefully handles errors:
- Shows clear error messages
- Provides fallback UI
- Continues functioning if AI is unavailable
- Logs errors for debugging

## Example Workflows

### Workflow 1: Building a Contact Form

1. Open GenUI Chat
2. Type: "Create a contact form with name, email, and message"
3. AI generates appropriate input fields
4. Interact with the generated form
5. Modify your request: "Add a phone number field"
6. AI updates the interface

### Workflow 2: Product Browsing

1. Open GenUI Chat
2. Type: "Show me product cards for electronics"
3. AI generates product display components
4. Request: "Add filters for price and brand"
5. AI adds filter controls
6. Request: "Show in a grid layout"
7. AI rearranges to grid

### Workflow 3: Data Dashboard

1. Open GenUI Chat
2. Type: "Create a sales dashboard"
3. AI generates dashboard layout
4. Request: "Add a chart showing monthly trends"
5. AI adds visualization component
6. Request: "Include summary cards for key metrics"
7. AI adds metric displays

## Troubleshooting

### AI Not Responding

**Check:**
- Firebase configuration is correct
- Internet connectivity is available
- Firebase AI is enabled in your project
- Billing is enabled (if required)

**Solutions:**
- Restart the app
- Check Firebase Console for errors
- Verify API quotas
- Review system logs

### Unexpected UI Output

**Check:**
- Prompt is clear and specific
- Widget catalog includes needed components
- System instruction is appropriate

**Solutions:**
- Refine your prompt
- Add constraints to your request
- Extend the widget catalog
- Provide more context

### Performance Issues

**Check:**
- Network latency
- Number of concurrent requests
- Complexity of generated UI

**Solutions:**
- Simplify requests
- Implement caching
- Use progressive loading
- Optimize widget catalog

## Testing Your Changes

### Manual Testing

1. **Test Basic Flow:**
   - Open app → Navigate to chat → Send message

2. **Test Edge Cases:**
   - Very long prompts
   - Invalid requests
   - Network interruptions

3. **Test Different Scenarios:**
   - Various prompt types
   - Different UI requirements
   - Multiple interactions

### Automated Testing

Run the test suite:
```bash
flutter test
```

Add tests for new features:
```dart
testWidgets('Custom feature test', (WidgetTester tester) async {
  // Your test code
});
```

## Security Considerations

### API Keys
- Never commit real Firebase credentials
- Use environment variables
- Rotate keys regularly

### User Input
- Validate all inputs
- Sanitize displayed content
- Limit request frequency

### AI Output
- Validate generated UI
- Check for appropriate content
- Implement safety filters

## Performance Monitoring

### Metrics to Track
- Response time for AI requests
- UI render time
- Network usage
- Memory consumption

### Optimization Strategies
- Cache common patterns
- Batch requests when possible
- Lazy load components
- Optimize widget rebuilds

## Future Enhancements

Potential areas for extension:

1. **Multi-modal Input** - Voice, images, gestures
2. **Personalization** - Learn user preferences
3. **Offline Support** - Cache common patterns
4. **A/B Testing** - Compare AI-generated variants
5. **Analytics** - Track UI effectiveness
6. **Templates** - Pre-built UI patterns
7. **Collaboration** - Share UI patterns

## Resources

### Documentation
- [GenUI Official Docs](https://docs.flutter.dev/ai/genui)
- [Firebase AI Docs](https://firebase.google.com/docs/ai)
- [Flutter Documentation](https://flutter.dev/docs)

### Community
- [Flutter Discord](https://discord.gg/flutter)
- [r/FlutterDev](https://reddit.com/r/flutterdev)
- [Flutter Community](https://flutter.dev/community)

### Examples
- [GenUI GitHub](https://github.com/flutter/genui)
- [Sample Apps](https://github.com/flutter/samples)

## Getting Help

If you need assistance:

1. **Check Documentation** - README.md, SETUP.md, this guide
2. **Review Examples** - Look at the examples screen
3. **Search Issues** - GitHub issues may have answers
4. **Ask the Community** - Flutter forums and Discord
5. **Open an Issue** - Create a detailed bug report or question

## Feedback

We welcome feedback on:
- Feature requests
- Bug reports
- Documentation improvements
- Usage patterns
- Performance issues

Please open an issue on GitHub with your feedback.

---

Happy exploring with AI-powered UIs! 🚀
