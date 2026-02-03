import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // Firebase initialization failed - this is expected if credentials haven't been configured
    // See FIREBASE_CONFIG.md for setup instructions
    debugPrint('WARNING: Firebase initialization error: $e');
    debugPrint('TIP: To enable Firebase features, configure your credentials in lib/firebase_options.dart');
    debugPrint('INFO: See FIREBASE_CONFIG.md for detailed setup instructions');
  }
  
  runApp(const AIExplorerApp());
}

class AIExplorerApp extends StatelessWidget {
  const AIExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Explorer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
