import 'package:flutter_test/flutter_test.dart';
import 'package:ai_explorer/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AIExplorerApp());

    // Verify that the home screen loads
    expect(find.text('AI Explorer - GenUI Showcase'), findsOneWidget);
    expect(find.text('Welcome to AI Explorer'), findsOneWidget);
  });

  testWidgets('Navigation to GenUI Chat works', (WidgetTester tester) async {
    await tester.pumpWidget(const AIExplorerApp());

    // Find and tap the GenUI Chat card
    await tester.tap(find.text('GenUI Chat'));
    await tester.pumpAndSettle();

    // Verify that we navigated to the chat screen
    expect(find.text('GenUI Chat'), findsOneWidget);
  });

  testWidgets('Navigation to Examples works', (WidgetTester tester) async {
    await tester.pumpWidget(const AIExplorerApp());

    // Find and tap the Examples card
    await tester.tap(find.text('Examples'));
    await tester.pumpAndSettle();

    // Verify that we navigated to the examples screen
    expect(find.text('GenUI Examples'), findsOneWidget);
  });

  testWidgets('Agent Skills card is present on home screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const AIExplorerApp());

    expect(find.text('Agent Skills'), findsOneWidget);
    expect(
      find.text('Find and browse agent skills from leading AI platforms'),
      findsOneWidget,
    );
  });

  testWidgets('Navigation to Agent Skills works', (WidgetTester tester) async {
    await tester.pumpWidget(const AIExplorerApp());

    // Tap the Agent Skills card
    await tester.tap(find.text('Agent Skills'));
    await tester.pumpAndSettle();

    // Verify that we navigated to the Agent Skills screen
    expect(find.text('Agent Skills'), findsOneWidget);
    // Verify both tabs are rendered
    expect(find.text('Browse Skills'), findsOneWidget);
    expect(find.text('Sources'), findsOneWidget);
  });
}
