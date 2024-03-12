// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class PharmacySpotter extends StatefulWidget {
//   const PharmacySpotter({Key? key}) : super(key: key);
//
//   @override
//   _PharmacySpotterState createState() => _PharmacySpotterState();
// }
//
// class _PharmacySpotterState extends State<PharmacySpotter> {
//   late Position _currentPosition;
//   late String _nearestPharmacy = '';
//   String _medicineName='';
//
//   Future<void> _getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       _currentPosition = position;
//     });
//   }
//
//   Future<void> _searchPharmacies() async {
//     if (_currentPosition == null) return;
//
//     print('Searching for pharmacies with medicine name: $_medicineName');
//     final response = await http.get(
//       Uri.parse(
//           'http://10.0.2.2:5000/searchPharmacies?medicineName=$_medicineName'),
//       // headers: {
//       //   'Content-Type': 'application/json',
//       // },
//     );
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         _nearestPharmacy = data['nearestPharmacy']['pharmacy'];
//       });
//     } else {
//       throw Exception('Failed to load pharmacies');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Find Nearest Pharmacy'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           TextField(
//             onChanged: (value) {
//               setState(() {
//                 _medicineName = value;
//               });
//             },
//             decoration: InputDecoration(
//               hintText: 'Enter medicine name',
//             ),
//           ),
//           SizedBox(height: 16),
//           Text(
//             'Nearest Pharmacy:',
//           ),
//           Text(
//             _nearestPharmacy ?? 'Unknown',
//             style: Theme.of(context).textTheme.headline4,
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await _getCurrentLocation();
//           await _searchPharmacies();
//         },
//         tooltip: 'Search',
//         child: Icon(Icons.search),
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
// }




import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';


class PharmacySearchPage1 extends StatefulWidget {
  // const PharmacySearchPage({super.key});

  @override
  State<PharmacySearchPage1> createState() => _PharmacySearchPage1State();
}

class _PharmacySearchPage1State extends State<PharmacySearchPage1> {
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

      final Uri url = Uri.parse('http://10.0.2.2:9000/searchPharmacies?userMedicine=$medicineName&userLatitude=$userLat&userLongitude=$userLong');

      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData);
        final dynamic nearestPharmacyValue = responseData['nearestPharmacyName'];
        // final dynamic mapLinkValue = responseData['mapLink'];

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
            // mapLink = mapLinkValue!;
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'lib/images/6 Pharmacy locater-2.png'),
                  fit: BoxFit.cover,
                ),
              ),

            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20,top: 30, right: 3, bottom: 7),
                  child: Row(children: [

                    const SizedBox(width:1,height: 180,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome to ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'MedVault',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 29,
                            color: Colors.white,
                          ),
                        ),


                        SizedBox(
                          height: 40,
                          width: 20,
                          child: Image.asset('lib/images/Group 2085662530.png'),
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
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 2),
                      ],
                    ),

                    //Text('User Name, ${widget.email}'),

                    //const SizedBox(width: 8,),



                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            controller: medicineNameController,
                            decoration: InputDecoration(
                              labelText: 'Enter Medicine Name',),
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: isLoading ? null : searchNearestPharmacy,
                            child: isLoading ? CircularProgressIndicator() : Text('Search Nearest Pharmacy'),
                          ),
                          SizedBox(height: 16.0),
                          GestureDetector(
                            onTap: ()=> launchMapURL(mapLink),
                            child: Text(
                              'Nearest Pharmacy: $nearestPharmacyName\nMap Link: $mapLink',
                              style: TextStyle(fontSize: 16.0
                              ),
                            ),)
                        ],
                      ),
                    ),
                  ],
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}
