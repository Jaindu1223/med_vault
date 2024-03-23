import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:med_vault/main.dart';
import 'package:med_vault/pages/splash_screen.dart';
//import 'package:my_app/main.dart'; // Import the file containing MyApp widget

void main() {
  testWidgets('MyApp displays SplashScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify that MyApp displays SplashScreen
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
