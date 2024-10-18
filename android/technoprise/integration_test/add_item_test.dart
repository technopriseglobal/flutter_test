import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:technoprise/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Add Item Test', () {
    testWidgets('should add a new item', (WidgetTester tester) async {
      // Start the app
      await tester.pumpWidget(const Technoprise());

      // Tap on the "Add" button (Assuming you have a FAB or Button)
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Enter the title
      await tester.enterText(
          find.byType(TextFormField).at(0), 'New Item Title');

      // Enter the description
      await tester.enterText(
          find.byType(TextFormField).at(1), 'New Item Description');

      // Tap on "Add Item" button
      await tester.tap(find.byKey(const Key('AddItem')));
      await tester.pumpAndSettle();

      // Verify if the new item is added to the list
      expect(find.text('New Item Title'), findsOneWidget);
      expect(find.text('New Item Description'), findsOneWidget);
    });
  });
}
