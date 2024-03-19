
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class PrescribedPharmacySearchPage extends StatefulWidget {

  final String medicineName;

  const PrescribedPharmacySearchPage({Key? key, required this.medicineName}) : super(key: key);

  @override
  State<PrescribedPharmacySearchPage> createState() => _PrescribedPharmacySearchPage1State();
}

class _PrescribedPharmacySearchPage1State extends State<PrescribedPharmacySearchPage> {
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

    final String medicineName = widget.medicineName.toLowerCase();

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

    // final Uri url = Uri.parse('http://10.0.2.2:4000/searchPharmacies?userMedicine=$medicineName&latitude=$userLatitude&longitude=$userLongitude');

    // final Uri url = Uri.parse('http://10.0.2.2:4000/searchPharmacies?userMedicine=$medicineName&userLatitude=$userLat&userLongitude=$userLong');

    try {
      final Uri url = Uri.parse(
          'http://10.0.2.2:2000/searchPharmacies?userMedicine=$medicineName&userLatitude=$userLat&userLongitude=$userLong');

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
        // } else {
        //   throw Exception('Unexpected data type for nearestPharmacy');
        // }
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

    return Scaffold(
      //appBar: AppBar(
      //title: Text('Pharmacy Search'),
      //),
      body: Stack(
          children: [
            Container(
              //height: MediaQuery.of(context).size.height, // Use MediaQuery to get the screen height
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/6 Pharmacy locater-2.png'),
                  fit: BoxFit.cover,
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
                          'lib/images/image 9326.png',
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
                      // TextField(
                      //   controller: medicineNameController,
                      //   decoration: InputDecoration(
                      //     labelText: 'Enter Medicine Name',
                      //   ),
                      // ),
                      SizedBox(height: 16.0),

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
                            : Text(
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
                      left: 0, top: 10, right: 90, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pharmacy Name: $nearestPharmacyValue',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'City: $cityValue',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Contact: $contactValue',
                        style: TextStyle(
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
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/images/search1.png'),
                          //xfit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  // padding: const EdgeInsets.only(
                  //     left: 0, top: 0, right: 220, bottom: 10),
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
                    child: Text('Go to map',
                      style: TextStyle(
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ]),
    );
  }
}