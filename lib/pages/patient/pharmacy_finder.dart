import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class PharmacySearchScreen extends StatefulWidget {
  @override
  _PharmacySearchScreenState createState() => _PharmacySearchScreenState();
}

class _PharmacySearchScreenState extends State<PharmacySearchScreen> {
  TextEditingController _medicineController = TextEditingController();
  String _pharmacyName = '';

  Future<void> searchPharmacy() async {
    final response = await http.post(
      // Uri.parse('https://127.0.0.1:27017/searchPharmacies'),
      Uri.parse('http://localhost:4000/searchPharmacies'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'medicineName': _medicineController.text,
      }),
    );

    if (response.statusCode == 200) {
      final parsedResponse = jsonDecode(response.body);
      setState(() {
        _pharmacyName = parsedResponse['pharmacy']['name'];
      });
    } else {
      setState(() {
        _pharmacyName = 'Error: ${response.statusCode}';
      });
    }

    // Check if _pharmacyName is still empty after receiving response
    if (_pharmacyName.isEmpty) {
      setState(() {
        _pharmacyName = 'Medicine not found';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacy Locator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _medicineController,
              decoration: InputDecoration(
                labelText: 'Enter Medicine Name',
              ),
            ),
            ElevatedButton(
              onPressed: () => searchPharmacy(),
              child: Text('Search Pharmacy'),
            ),
            SizedBox(height: 20),
            Text('Pharmacy Name: $_pharmacyName'),
          ],
        ),
      ),
    );
  }
}




