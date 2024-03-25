// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:med_vault/main.dart';
// import 'package:med_vault/pages/catergory.dart';
// import 'package:med_vault/pages/splash_screen.dart';
// //import 'package:my_app/main.dart'; // Import the file containing MyApp widget
//
//
//
// void main() {
//   testWidgets('MyApp widget test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());
//
//     // Verify that the app starts with SplashScreen.
//     expect(find.byType(Category), findsOneWidget);
//   });
// }
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:med_vault/pages/catergory.dart';
import 'package:med_vault/pages/doctor/signin_doc.dart';
import 'package:med_vault/pages/patient/sign_in.dart';
import 'package:med_vault/pages/doctor/home_pageD.dart';
import 'package:med_vault/pages/doctor/signup_doc.dart';
import 'package:med_vault/pages/doctor/new_prescription.dart';

import 'package:med_vault/pages/patient/medical_record.dart';


//import 'package:med_vault/pages/category.dart';

void main() {
  testWidgets('Category widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Category(),
    ));

    // Verify that the "Tailor Your Experience" text is displayed.
    expect(find.text('Tailor Your Experience'), findsOneWidget);

    // Verify that the "To provide you with a good experience, please select your role below:" text is displayed.
    expect(find.text('To provide you with a good \n experience, please select your \n role below:'), findsOneWidget);

    // Verify that the "Doctor" radio button is displayed.
    expect(find.text('Doctor'), findsOneWidget);

    // Verify that the "Patient" radio button is displayed.
    expect(find.text('Patient'), findsOneWidget);

    // Tap on the "Doctor" radio button and verify that it navigates to SignInDoc page.
    await tester.tap(find.text('Doctor'));
    await tester.pumpAndSettle();
    expect(find.byType(SignInDoc), findsOneWidget);

    // Tap on the "Patient" radio button and verify that it navigates to SignIn page.
    await tester.tap(find.text('Patient'));
    await tester.pumpAndSettle();
    expect(find.byType(SignIn), findsOneWidget);
  });
}
