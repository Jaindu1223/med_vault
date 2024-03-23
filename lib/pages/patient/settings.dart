import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSettingsSection(
            title: 'Profile',
            icon: Icons.person,
            onTap: () {
              // Handle profile section tap
            },
          ),
          const SizedBox(
            height: 35,
            width: 10,
          ),
          _buildSettingsSection(
            title: 'About Us',
            icon: Icons.info,
            onTap: () {
              // Handle about us section tap
            },
          ),
          const SizedBox(
            height: 35,
            width: 10,
          ),
          _buildSettingsSection(
            title: 'Privacy',
            icon: Icons.lock,
            onTap: () {
              // Handle privacy section tap
            },
          ),
          const SizedBox(
            height: 35,
            width: 10,
          ),
          _buildSettingsSection(

            title: 'Security',
            icon: Icons.security,
            onTap: () {
              // Handle security section tap
            },
          ),

        ],
      ),
    );
  }

  Widget _buildSettingsSection({required String title, required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.blueAccent,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.blueAccent,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}

