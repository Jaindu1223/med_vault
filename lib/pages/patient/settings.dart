
import 'package:med_vault/pages/catergory.dart';
import 'package:med_vault/pages/patient/patient_profile.dart';
import 'package:med_vault/pages/patient/sign_in.dart';
import 'package:med_vault/pages/privacy.dart';
import 'package:med_vault/pages/security.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:med_vault/pages/patient/check.dart';
import 'package:med_vault/pages/patient/home_page.dart';
import 'package:med_vault/pages/patient/my_qr.dart';
import 'package:med_vault/pages/patient/navigation_components.dart';

import '../about_us.dart';

class SettingsPage extends StatefulWidget {
  final String email;

  const SettingsPage({Key? key, required this.email}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _currentIndex = 3; // Initialize with the index of the SettingsPage

  @override

  Widget build(BuildContext context) {
    Color customBackgroundColor = Color(int.parse('0xFFE3E4E4'));
    return Scaffold(
      backgroundColor: customBackgroundColor,
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PatientProfile()),
              );
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsPage()),
              );
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPage()),
              );
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecurityPage()),
              );
            },
          ),
          const SizedBox(
            height: 35,
            width: 10,
          ),
          _buildSettingsSection(
            title: 'Logout',
            icon: Icons.logout,
            onTap: () {
              // Handle logout section tap
              _logout();
            },
          ),

        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Handle navigation based on the index
          switch (index) {
            case 0:
              NavigationService.navigateTo(HomePage(email: widget.email), context);
              break;
            case 1:
              NavigationService.navigateTo(PharmacySearchPage1(email: widget.email), context);
              break;
            case 2:
              NavigationService.navigateTo(MyQR(email: widget.email), context);
              break;
            case 3:
              NavigationService.navigateTo(SettingsPage(email: widget.email), context);
              break;
          }
        },
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
  void _logout() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove('email'); // Remove email from SharedPreferences
    });

    // Navigate back to the login page
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Category()),
          (Route<dynamic> route) => false,
    );
  }
}


