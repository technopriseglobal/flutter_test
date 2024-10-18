import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:technoprise/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Delete Item Test', () {
    testWidgets('should delete an existing item', (WidgetTester tester) async {
      // Start the app
      await tester.pumpWidget(const Technoprise());

      // Assume there is already an item called 'Rainforest Ecosystems'
      expect(find.text('Rainforest Ecosystems'), findsOneWidget);

      // Find the delete icon next to the item 'Rainforest Ecosystems'
      final deleteIcon = find.byKey(const Key('DeleteItem0'));
      // Ensure the delete icon is found
      expect(deleteIcon, findsOneWidget);

      // Tap the delete icon
      await tester.tap(deleteIcon);
      await tester.pumpAndSettle();

      // Verify that the item is deleted
      expect(find.text('Rainforest Ecosystems'), findsNothing);
    });
  });
}
