import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cheqr/main.dart';

void main() {
  testWidgets('Home screen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const CheqrApp());

    // Verify UI elements are present
    expect(find.text('Cheqr'), findsOneWidget);
    expect(find.text('Fact Checker'), findsOneWidget);
    expect(find.text('Enter a statement to verify'), findsOneWidget);
    expect(find.text('Check Statement'), findsOneWidget);
  });

  testWidgets('Check button shows loading state', (WidgetTester tester) async {
    await tester.pumpWidget(const CheqrApp());

    // Enter text
    await tester.enterText(find.byType(TextField), 'Test statement');
    await tester.tap(find.text('Check Statement'));
    await tester.pump();

    // Verify loading indicator appears
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}

