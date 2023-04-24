import 'package:bitsgap/src/features/authentification/view/authentification_view.dart';
import 'package:bitsgap/src/features/theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:bitsgap/src/features/authentification/application/auth_store.dart';

void main() {
  testWidgets('AuthentificationView shows Login and Sign-up buttons', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            Provider<ThemeStore>(create: (_) => ThemeStore()),
            Provider<AuthStore>(create: (_) => AuthStore()),
          ],
          child: AuthentificationView(),
        ),
      ),
    );

    // Verify that Login and Sign-up buttons are present.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Sign-up'), findsOneWidget);
  });
}