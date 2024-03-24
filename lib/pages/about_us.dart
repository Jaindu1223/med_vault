import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/aboutus/thihansa.jpg'),
          ),
          SizedBox(height: 16),
          Text(
            'Thihansa Akmeemana',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}