import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bus_ticketing_app/screens/login_screen.dart';

void main() {
  testWidgets('LoginScreen UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // Find widgets on the login screen using their keys, text, or other attributes.
    final emailField = find.byKey(const Key('email_field_key'));
    final passwordField = find.byKey(const Key('password_field_key'));
    final loginButton = find.byKey(const Key('login_button_key'));

    // Verify that the widgets are found.
    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(loginButton, findsOneWidget);

    // Enter text into the email and password fields.
    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, 'password123');

    // Tap the login button.
    await tester.tap(loginButton);

    // Rebuild the widget after the button press.
    await tester.pump();

    // Verify that your login logic triggers, e.g., you can check if the loading indicator appears.

    // Example: Check for the loading indicator.
    final loadingIndicator = find.byType(CircularProgressIndicator);
    expect(loadingIndicator, findsOneWidget);
  });
}
