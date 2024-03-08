import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewPrescription extends StatefulWidget {
  final String id;

  ViewPrescription({required this.id});

  @override
  _ViewPrescriptionState createState() => _ViewPrescriptionState();
}

class _ViewPrescriptionState extends State<ViewPrescription> {
  dynamic _prescription;

  @override
  void initState() {
    super.initState();
    _fetchPrescription();
  }

  Future<void> _fetchPrescription() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/prescriptions/${widget.id}'));

    if (response.statusCode == 200) {
      setState(() {
        _prescription = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load prescription');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription ${widget.id}'),
      ),
      body: _prescription == null
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Text(_prescription['patientName']),
          Text('Age: ${_prescription['age']}'),
          Text('Address: ${_prescription['address']}'),
          Text('Medications:'),
          Column(
            children: _prescription['medications']
                .map<Widget>(
                  (medication) => Column(
                children: [
                  Row(
                    children: [
                      Text('${medication['name']}: ${medication['dosage']} mg'),
                      SizedBox(width:16),
                      Expanded(child: Text(medication['details'])),
                    ],
                  ),
                  Divider(),
                ],
              ),
            )
                .toList(),
          ),
          Text('Additional Notes: ${_prescription['additional']}'),
          Text('Instructions: ${_prescription['instructions']}'),
        ],
      ),
    );
  }
}