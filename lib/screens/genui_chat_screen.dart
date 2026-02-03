import 'package:flutter/material.dart';
import 'package:genui/genui.dart';
import 'package:genui_firebase_ai/genui_firebase_ai.dart';

class GenUIChatScreen extends StatefulWidget {
  const GenUIChatScreen({super.key});

  @override
  State<GenUIChatScreen> createState() => _GenUIChatScreenState();
}

class _GenUIChatScreenState extends State<GenUIChatScreen> {
  late GenUiManager _genUiManager;
  late FirebaseAiContentGenerator _contentGenerator;
  late GenUiConversation _conversation;
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isInitialized = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initializeGenUI();
  }

  Future<void> _initializeGenUI() async {
    try {
      // Create a catalog of widgets that GenUI can use
      final catalog = CoreCatalogItems.asCatalog().copyWith([
        // Add custom catalog items here if needed
      ]);

      _genUiManager = GenUiManager(catalog: catalog);

      // Initialize Firebase AI content generator
      _contentGenerator = FirebaseAiContentGenerator(
        catalog: catalog,
        systemInstruction: '''
You are a helpful AI assistant that can create dynamic user interfaces.
You can generate UI components like cards, buttons, sliders, and text fields based on user requests.
Be creative and helpful in designing interfaces that match the user's intent.
''',
      );

      _conversation = GenUiConversation(
        genUiManager: _genUiManager,
        contentGenerator: _contentGenerator,
      );

      setState(() {
        _isInitialized = true;
      });

      // Add welcome message
      _addMessage(
        'AI Assistant',
        'Hello! I can help you create dynamic user interfaces. Try asking me to create a form, a product card, or any UI component you need!',
        isUser: false,
      );
    } catch (e) {
      setState(() {
        _error = 'Failed to initialize GenUI: ${e.toString()}';
        _isInitialized = false;
      });
      debugPrint('GenUI initialization error: $e');
    }
  }

  void _addMessage(String sender, String content, {required bool isUser}) {
    setState(() {
      _messages.add(ChatMessage(
        sender: sender,
        content: content,
        isUser: isUser,
      ));
    });
  }

  Future<void> _sendMessage() async {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;

    _addMessage('You', message, isUser: true);
    _messageController.clear();

    if (!_isInitialized) {
      _addMessage(
        'System',
        'GenUI is not initialized. Please check your Firebase configuration.',
        isUser: false,
      );
      return;
    }

    try {
      // Send message to GenUI conversation
      await _conversation.sendMessage(message);
      
      // TODO: Production implementation needed
      // In a production app, you would:
      // 1. Listen to _conversation.stream for AI responses
      // 2. Extract generated UI components from the response
      // 3. Render them using GenUI's rendering system
      // 4. Handle user interactions with generated UI
      // Example:
      // _conversation.stream.listen((response) {
      //   setState(() {
      //     // Update UI with response.generatedWidget
      //   });
      // });
      
      _addMessage(
        'AI Assistant',
        'I received your request. In a production app, dynamic UI would be generated here based on your message.',
        isUser: false,
      );
    } catch (e) {
      _addMessage(
        'Error',
        'Failed to process message: ${e.toString()}',
        isUser: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GenUI Chat'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          if (_error != null)
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.red.shade100,
              child: Row(
                children: [
                  const Icon(Icons.error, color: Colors.red),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isUser
              ? Theme.of(context).colorScheme.primary
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.sender,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: message.isUser ? Colors.white : Colors.black87,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              message.content,
              style: TextStyle(
                color: message.isUser ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Ask GenUI to create a UI...',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}

class ChatMessage {
  final String sender;
  final String content;
  final bool isUser;

  ChatMessage({
    required this.sender,
    required this.content,
    required this.isUser,
  });
}
