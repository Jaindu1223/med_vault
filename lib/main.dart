import 'package:flutter/material.dart';
import 'package:med_vault/pages/catergory.dart';

import 'package:med_vault/pages/patient/home_page.dart';
import 'package:med_vault/pages/patient/sign_in.dart';
import 'package:med_vault/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}





/*
class MedVaultHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MedVault'),
      ),
      body: Center(
        child: Card(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('path/to/image.png'),
                SizedBox(height: 16),
                Text(
                  'Welcome to MedVault',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Monday 23rd, July, 2060 3:21:59pm',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
