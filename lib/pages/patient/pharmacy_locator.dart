//
// import 'package:flutter/material.dart';
// import 'package:med_vault/pages/patient/home_page.dart';
// import 'package:med_vault/pages/patient/medical_record.dart';
//
// class PharmacyLocator extends StatefulWidget {
//   const PharmacyLocator({super.key});
//
//   @override
//   State<PharmacyLocator> createState() => _PharmacyLocatorState();
// }
//
// class _PharmacyLocatorState extends State<PharmacyLocator> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         //backgroundColor: Colors.blue[100],
//         body: Stack(
//             children:[
//               Container(
//                 decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                   'lib/images/6 Pharmacy locater-2.png'),
//                   fit: BoxFit.cover,
//                   //height: double.infinity,
//                   //width: double.infinity,
//               ),
//               ),
//             ),
//           Column(
//             children: [
//
//               Container(
//
//                 /*decoration: BoxDecoration(
//                 color: Colors.lightBlue
//               ),*/
//                 padding: const EdgeInsets.only(left: 20,top: 30, right: 3, bottom: 7),
//                 child: Row(children: [
//
//                   const SizedBox(width: 6,height: 190,),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//
//                     children: [
//                       const Text(
//                         'Medicine Spotter',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 25,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const Text(
//                         '<<caption>>',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w900,
//                           fontSize: 13,
//                           color: Colors.white,
//                         ),
//
//                       ),
//                       SizedBox(
//                         height: 40,
//                         width: 20,
//                         child: Image.asset(
//                             'lib/images/Group 2085662530.png'),
//
//                         //color: Colors.limeAccent,
//                       ),
//                       const SizedBox(height: 1),
//                       const Text(
//                         'Monday 23rd, July, 2060',
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 2),
//                       const Text(
//                         '3:21:59pm',
//                         style: TextStyle(
//                           fontSize: 10,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(width: 46,),
//
//
//
//                   SizedBox(
//                     height: 140,
//                     width: 100,
//                     child: Image.asset(
//                       'lib/images/medicine.png',),
//
//                     //color: Colors.limeAccent,
//                   ),
//
//
//                 ],),
//               ),
//
//               //search bar
//
//               //categories(horizontal list)
//               const SizedBox(height: 25),
//
//               //box
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 35.0),
//                 child: Container(
//
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(9)),
//                   child: Row(children: [
//
//                     /*SizedBox(
//
//                       height: 400,
//                       width: 100,
//                       child: Image.asset(
//                         'lib/images/prescription.png',),
//                       //color: Colors.blue,
//                     ),*/
//                     //const SizedBox(height: 35,width: 10,),
//
//                     Expanded(
//                       child:Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           const Text(
//                             'Available At:',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 14,
//                                 color: Colors.black87
//                             ),
//                           ),
//                           const Text(
//                             '<<Display Map>> ',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 11,
//                             ),
//                           ),
//                           const SizedBox(height: 330,),
//                           const Text(
//                             '<<Display Pharmacy Address>>',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 11,
//                             ),
//                           ),
//                           const SizedBox(height: 17),
//
//                           Padding(
//                             padding: const EdgeInsets.only(left: 150),
//                             child: Center(
//                               child: InkWell(
//                                 onTap: (){
//                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
//                                 },
//
//                                 child: Container(
//
//                                   //padding: const EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
//                                   padding: const EdgeInsets.all(4),
//                                   width: 150,
//
//
//                                   decoration: BoxDecoration(
//                                       color: Colors.blueAccent,
//                                       borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: const Center(
//                                     child: Text(
//                                         'Continue With Maps',
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 11)
//
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     )
//                   ],),
//                 ),
//               ),
//
//               const SizedBox(height: 25),
//
//               /*Container(
//
//                 child: Row(children: [
//                   Container(
//                     height: 100,
//                     width: 100,
//                     color: Colors.limeAccent,
//                   ),
//
//                   const Column(
//                     children: [
//                       Text('Welcome to '),
//                       Text('MedVault')
//                     ],
//                   ),
//
//                 ],),
//               ),*/
//               //doctor list
//
//             ],
//           ),
//
//
//         ])
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PharmacyLocator extends StatefulWidget {
  const PharmacyLocator({Key? key}) : super(key: key);

  @override
  _PharmacyLocatorState createState() => _PharmacyLocatorState();
}

class _PharmacyLocatorState extends State<PharmacyLocator> {
  late TextEditingController _searchController;
  List<Pharmacy> _pharmacies = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _fetchPharmacies();
    // Fetch pharmacies from the backend here
  }

  Future<void> _fetchPharmacies() async {
    // const url = 'http://localhost:3000/pharmacies';
    // final response = await http.get(Uri.parse(url));
    //
    // if (response.statusCode == 200) {
    //   setState(() {
    //     _pharmacies = (jsonDecode(response.body) as List)
    //         .map((json) => Pharmacy.fromJson(json))
    //         .toList();
    //   });
    // } else {
    //   throw Exception('Failed to load pharmacies');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy Locator'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search for a medicine',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _filterPharmacies(value);
              },
            ),
          ),
          const SizedBox(height: 16),
          // Expanded(
          //   child: _pharmacies.isNotEmpty
          //       ? ListView.builder(
          //     itemCount: _pharmacies.length,
          //     itemBuilder: (context, index) {
          //       final pharmacy = _pharmacies[index];
          //       return ListTile(
          //         leading: Icon(Icons.pharmacy),
          //         title: Text(pharmacy.name),
          //         subtitle: Text(pharmacy.location),
          //       );
          //     },
          //   )
          //       : Center(
          //     child: Text('No pharmacies found'),
          //   ),
          // ),

          Expanded(
            child: _pharmacies.isNotEmpty
                ? ListView.builder(
              itemCount: _pharmacies.length,
              itemBuilder: (context, index) {
                final pharmacy = _pharmacies[index];
                return ExpansionTile(
                  title: Text(pharmacy.name),
                  subtitle: Text(pharmacy.location),
                  children: pharmacy.medicines.map((medicine) {
                    return ListTile(
                      title: Text(medicine.name),
                      trailing: Text('${medicine.stock} in stock'),
                    );
                  }).toList(),
                );
              },
            )
                : Center(
                  child: Text('No pharmacies found'),
            ),
          ),
        ],
      ),
    );
  }

  void _filterPharmacies(String query) {
    List<Pharmacy> filteredPharmacies = _pharmacies.where((pharmacy) {
      return pharmacy.medicines.any((medicine) {
        return medicine.name.toLowerCase().contains(query.toLowerCase());
      });
    }).toList();
    setState(() {
      _pharmacies = filteredPharmacies;
    });
  }

// void _filterPharmacies(String query) {
//   List<Pharmacy> filteredPharmacies = _pharmacies.where((pharmacy) {
//     return pharmacy.medicines.any((medicine) {
//       return medicine['name'].toLowerCase().contains(query.toLowerCase());
//     });
//   }).toList();
//   setState(() {
//     _pharmacies = filteredPharmacies;
//   });
// }

}

class Pharmacy {
  final String name;
  final String location;
  final List<Medicine> medicines;

  Pharmacy({
    required this.name,
    required this.location,
    required this.medicines,
  });

  factory Pharmacy.fromJson(Map<String, dynamic> json) {
    return Pharmacy(
      name: json['name'],
      location: json['location'],
      medicines: json['medicines']
          .map<Medicine>((medicineJson) => Medicine.fromJson(medicineJson))
          .toList(),
    );
  }
}

class Medicine {
  final String name;
  final int stock;

  Medicine({
    required this.name,
    required this.stock,
  });
  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      name: json['name'],
      stock: json['stock'],
    );
  }

}