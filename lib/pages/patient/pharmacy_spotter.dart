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
import 'package:http/http.dart' as http;


class PharmacySearchPage extends StatefulWidget {
  // const PharmacySearchPage({super.key});

  @override
  State<PharmacySearchPage> createState() => _PharmacySearchPageState();
}

class _PharmacySearchPageState extends State<PharmacySearchPage> {
  TextEditingController medicineNameController = TextEditingController();
  String nearestPharmacyName = '';
  bool isLoading = false;

  Future<void> searchNearestPharmacy() async {
    setState(() {
      isLoading = true;
    });

    final String medicineName = medicineNameController.text.toLowerCase();

    print('medicine name: $medicineName');
    final Uri url = Uri.parse('http://10.0.2.2:9000/searchPharmacies?medicineName=$medicineName');

    try {
      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData);
        final dynamic nearestPharmacyValue = responseData['nearestPharmacyName'];
        // final pharmacyName = nearestPharmacyValue['pharmacy'];
        if (nearestPharmacyValue is String) {
          setState(() {
            nearestPharmacyName = nearestPharmacyValue;
            isLoading = false;
          });
        } else {
          throw Exception('Unexpected data type for nearestPharmacy');
        }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacy Search'),
      ),
      body: Padding(
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
            SizedBox(height: 16.0),
            Text(
              'Nearest Pharmacy: $nearestPharmacyName',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
