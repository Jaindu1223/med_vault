import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatefulWidget {
  QrGenerator({super.key, required this.title});

  final String title;

  @override
  _QrGeneratorState createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  String? _qrCodeData;

  @override
  void initState() {
    super.initState();
    _generateUniqueQRCode();
  }

  void _generateUniqueQRCode() {
    // Replace this with the actual user data from your system
    String userData = '{"id":123,"name":"John Doe","email":"john.doe@example.com"}';
    String uniqueCode = '${DateTime.now().millisecondsSinceEpoch}';
    String qrCodeData = '$userData|$uniqueCode';
    setState(() {
      _qrCodeData = qrCodeData;
      print('QR code data: $_qrCodeData');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (_qrCodeData != null && _qrCodeData!.isNotEmpty)
            ? Container(
          width: 200.0,
          height: 200.0,
          child: QrImageView(
            data: _qrCodeData!,
            version: QrVersions.auto,
            size: 200.0,
          ),
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}