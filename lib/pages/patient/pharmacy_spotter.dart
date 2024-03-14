
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


class PharmacySearchPage extends StatefulWidget {
  // const PharmacySearchPage({super.key});

  @override
  State<PharmacySearchPage> createState() => _PharmacySearchPageState();
}

class _PharmacySearchPageState extends State<PharmacySearchPage> {
  TextEditingController medicineNameController = TextEditingController();
  String nearestPharmacyName = '';
  String mapLink = '';
  bool isLoading = false;

  Future<void> searchNearestPharmacy() async {
    setState(() {
      isLoading = true;
    });

    final String medicineName = medicineNameController.text.toLowerCase();

    print('medicine name: $medicineName');

    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        print('Location permissions are denied');
        setState(() {
          nearestPharmacyName = 'Location permissions are denied';
          isLoading = false;
        });
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final double userLat = position.latitude;
    final double userLong = position.longitude;

    print('User latitude: $userLat, User longitude: $userLong');


    // final Uri url = Uri.parse('http://10.0.2.2:4000/searchPharmacies?userMedicine=$medicineName&latitude=$userLatitude&longitude=$userLongitude');

    // final Uri url = Uri.parse('http://10.0.2.2:4000/searchPharmacies?userMedicine=$medicineName&userLatitude=$userLat&userLongitude=$userLong');

    try {

      final Uri url = Uri.parse('http://10.0.2.2:2000/searchPharmacies?userMedicine=$medicineName&userLatitude=$userLat&userLongitude=$userLong');

      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData);
        final dynamic nearestPharmacyValue = responseData['nearestPharmacyName'];
        final dynamic mapLinkValue = responseData['mapLink'];

        if (nearestPharmacyValue== null || nearestPharmacyValue is! String) {
          setState(() {
            nearestPharmacyName = '$medicineName is not available';
            mapLink = '';
            isLoading = false;
          });
          return;

        }else{
          setState(() {
            nearestPharmacyName = nearestPharmacyValue;
            mapLink = mapLinkValue!;
            isLoading = false;
          });

        };
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

  void launchMapURL(String mapLink)async{
    Uri map = Uri.parse(mapLink);
    if(await canLaunchUrl(map)){
      await launchUrl(map);
    }else{
      throw 'Could not launch map';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: medicineNameController,
                  decoration: InputDecoration(
                    labelText: 'Enter Medicine Name',
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: isLoading ? null : searchNearestPharmacy,
                  child: isLoading ? CircularProgressIndicator() : Text('Search Nearest Pharmacy'),
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
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () => launchMapURL(mapLink),
              child: Text('Go to map'),
            ),
          ),
        ],
      ),
    );
  }


}
