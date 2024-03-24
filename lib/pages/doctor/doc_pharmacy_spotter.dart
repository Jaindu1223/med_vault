import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:med_vault/pages/doctor/home_pageD.dart';
import 'package:med_vault/pages/doctor/navigation_components_doc.dart';
import 'package:med_vault/pages/doctor/qr_scan.dart';
import 'package:med_vault/pages/patient/home_page.dart';
import 'package:med_vault/pages/patient/my_qr.dart';
import 'package:med_vault/pages/patient/navigation_components.dart';
import 'package:med_vault/pages/patient/settings.dart';
import 'package:url_launcher/url_launcher.dart';

import 'doc_settings.dart';

class PharmacySearchPage2 extends StatefulWidget {
  // const PharmacySearchPage({super.key});

  final String email;

  final String docemail;
  const PharmacySearchPage2({Key? key, required this.email,required this.docemail}) : super(key: key);

  @override
  State<PharmacySearchPage2> createState() => _PharmacySearchPage2State();
}

class _PharmacySearchPage2State extends State<PharmacySearchPage2> {
  int _currentIndexD = 1;

  TextEditingController medicineNameController = TextEditingController();
  String nearestPharmacyName = '';
  String mapLink = '';
  String nearestPharmacyValue = '';
  String cityValue = '';
  String contactValue = '';
  bool isLoading = false;

  Future<void> searchNearestPharmacy() async {
    setState(() {
      isLoading = true;
    });

    final String medicineName = medicineNameController.text.toLowerCase();

    print('medicine name: $medicineName');

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        setState(() {
          nearestPharmacyName = 'Location permissions are denied';
          isLoading = false;
        });
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final double userLat = position.latitude;
    final double userLong = position.longitude;

    print('User latitude: $userLat, User longitude: $userLong');

    try {
      final Uri url = Uri.parse(
          'https://medvault-backend-wv3ggtvglq-uc.a.run.app/searchPharmacies?userMedicine=$medicineName&userLatitude=$userLat&userLongitude=$userLong');

      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData);
        final dynamic nearestPharmacyValueResponse =
        responseData['nearestPharmacyName'];
        final dynamic mapLinkValue = responseData['mapLink'];
        final dynamic cityValueResponse = responseData['city'];
        final dynamic contactValueResponse = responseData['contact'];

        if (nearestPharmacyValue == null || nearestPharmacyValue is! String) {
          setState(() {
            nearestPharmacyName = '$medicineName is not available';
            mapLink = '';
            isLoading = false;
          });
          return;
        } else {
          setState(() {
            nearestPharmacyName = nearestPharmacyValue;
            mapLink = mapLinkValue!;
            nearestPharmacyValue = nearestPharmacyValueResponse!;
            cityValue = cityValueResponse!;
            contactValue = contactValueResponse!;
            isLoading = false;
          });
        }
        ;

      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        nearestPharmacyName = 'Error occurred';
        isLoading = false;
      });
    }
  }

  void launchMapURL(String mapLink) async {
    Uri map = Uri.parse(mapLink);
    if (await canLaunchUrl(map)) {
      await launchUrl(map);
    } else {
      throw 'Could not launch map';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get current date and time
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE d MMMM, y')
        .format(now); // Format: Monday 23 July, 2022
    String formattedTime = DateFormat.jm().format(now); // Format: 3:21:59 PM

    Color customBackgroundColor = Color(int.parse('0xFFE3E4E4'));

    return Scaffold(
      backgroundColor: customBackgroundColor,
      resizeToAvoidBottomInset: false, // Prevents resizing when the keyboard is displayed
      body: Stack(
          children: [
            Container(
              //padding: const EdgeInsets.only(left: 20,top: 30, right: 3, bottom: 30),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'lib/images/Rectangle 42126.png'),
                  alignment: Alignment.topCenter,

                  fit: BoxFit.fitWidth,
                ),
              ),

            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, top: 15, right: 3, bottom: 7),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 1,
                        height: 180,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nearest Pharmacy ',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'MedVault',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 20,
                            child: Image.asset(
                                'lib/images/Group 2085662530.png'),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            formattedDate,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            formattedTime,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                        ],
                      ),

                      //Text('User Name, ${widget.email}'),

                      const SizedBox(
                        width: 6,
                      ),
                      SizedBox(
                        height: 140,
                        width: 100,
                        child: Image.asset(
                          'lib/images/capsule-158568_1920.png',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: medicineNameController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Medicine Name',
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      ElevatedButton(
                        onPressed: isLoading ? null : searchNearestPharmacy,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue, // Set the background color to blue
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40), // Set the border radius
                          ),
                          minimumSize: Size(0, 40), // Set the minimum size of the button
                        ),
                        child: isLoading
                            ? CircularProgressIndicator()
                            : const Text(
                          'Search Nearest Pharmacy',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,

                          ), // Set the text color to white
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, top: 10, right: 130, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pharmacy Name: $nearestPharmacyValue',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'City: $cityValue',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Contact: $contactValue',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/images/search1.png'),
                          //xfit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, top: 0, right: 220, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () => launchMapURL(mapLink),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Set the border radius
                      ),
                      minimumSize: Size(130, 40),
                      // Set the background color to blue
                    ),
                    child: const Text('Go to map',
                      style: TextStyle(
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ]),


      bottomNavigationBar: CustomBottomNavigationBar2(
        currentIndexD: _currentIndexD, // Pass the currentIndexD
        onTap: (index) {
          setState(() {
            _currentIndexD = index; // Update currentIndexD when tapped
          });

          // Handle navigation based on the index
          switch (index) {
            case 0:
              NavigationServiceDoc.navigateTo(
                  HomePageDoc(email: widget.email, docemail: widget.docemail),
                  context);
              break;
            case 1:
              NavigationServiceDoc.navigateTo(
                  PharmacySearchPage2(email: widget.email,docemail: widget.docemail),
                  context);
              break;
            case 2:
              NavigationServiceDoc.navigateTo(
                  QrScan(email: widget.email,docemail: widget.docemail),
                  context); // Already on QrScan page, no need to navigate
              break;
            case 3:
              NavigationServiceDoc.navigateTo(
                  docSettingsPage(email: widget.email,docemail: widget.docemail),
                  context);
              break;
          }
        },
      ),

    );
  }
}
