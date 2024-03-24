import 'dart:async';
import 'package:flutter/material.dart';
import 'package:med_vault/pages/catergory.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Category()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/medvault.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'MedVault',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                 // fontFamily: 'Lato',
                ),
              ),
            ),
          ),
          Positioned(
            top: 83,
            right: 9,
            child: Container(
              padding: const EdgeInsets.all(8.0),

              child: const Text(
                'Get your nearest pharmacy',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
