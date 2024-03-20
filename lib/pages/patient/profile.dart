import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_vault/pages/patient/sign_in.dart';
import 'package:http/http.dart' as http;

class LogoutPage extends StatelessWidget {
  final String fullName;
  final String birthdate;
  final String address;
  final String email;
  final String nic;
  final String phoneNumber;

  LogoutPage({
    required this.fullName,
    required this.birthdate,
    required this.address,
    required this.email,
    required this.nic,
    required this.phoneNumber,
  });

  Future<void> _logout(BuildContext context) async {
    // Implement logout functionality here
    // For example, clear user session or token
    // and navigate to login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Full Name: $fullName'),
            Text('Date of Birth: $birthdate'),
            Text('Address: $address'),
            Text('Email: $email'),
            Text('NIC: $nic'),
            Text('Phone Number: $phoneNumber'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _logout(context),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
