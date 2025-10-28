import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cheqr/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CheqrApp());

    // Verify that the app title is present
    expect(find.text('Cheqr'), findsOneWidget);
    expect(find.text('Fact Checker'), findsOneWidget);
  });

  testWidgets('User can enter text in the text field', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CheqrApp());

    // Find the text field
    final textField = find.byType(TextField);
    expect(textField, findsOneWidget);

    // Enter text
    await tester.enterText(textField, 'This is a test statement');
    await tester.pump();

    // Verify the text was entered
    expect(find.text('This is a test statement'), findsOneWidget);
  });
}

