import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bus_ticketing_app/screens/login_screen.dart';

void main() {
  testWidgets('LoginScreen widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Verify that the "Sign In" text is displayed.
    expect(find.text('Sign In'), findsOneWidget);

    // Enter text in the email and password fields.
    await tester.enterText(find.byType(TextField).first, 'test@example.com');
    await tester.enterText(find.byType(TextField).last, 'password123');

    // Tap the "Sign In" button.
    await tester.tap(find.text('Sign In'));
    await tester.pumpAndSettle();

    // Verify that the "Don't have an account?" text is displayed.
    expect(find.text("Don't have an account?"), findsOneWidget);

    // Verify that the "Sign Up" text is displayed.
    expect(find.text('Sign Up'), findsOneWidget);
  });
}
