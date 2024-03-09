// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:med_vault/pages/doctor/home_pageD.dart';
// import 'package:http/http.dart' as http;
//
// class NewPrescription extends StatefulWidget {
//   const NewPrescription({super.key});
//
//   @override
//   State<NewPrescription> createState() => _NewPrescriptionState();
// }
//
// class _NewPrescriptionState extends State<NewPrescription> {
//   final _patientNameController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _addressController = TextEditingController();
//   final _medicationNameController = TextEditingController();
//   final _dosageController = TextEditingController();
//   final _instructionsController = TextEditingController();
//
//   Future<void> _submitForm() async {
//     final patientName = _patientNameController.text;
//     final age = int.tryParse(_ageController.text);
//     final address = _addressController.text;
//     final medicationName = _medicationNameController.text;
//     final dosage = int.tryParse(_dosageController.text);
//     final instructions = _instructionsController.text;
//
//     if (patientName == null || age == null || address.isEmpty || medicationName.isEmpty || dosage == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill in all fields')),
//       );
//       return;
//     }
//
//     final response = await http.post(
//       Uri.parse('http://10.0.2.2:3000/saveprescription'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, dynamic>{
//         'patientName': patientName,
//         'age': age,
//         'address': address,
//         'medicationName': medicationName,
//         'dosage': dosage,
//         'instructions': instructions,
//       }),
//     );
//
//     if (response.statusCode == 201) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Prescription saved successfully')),
//       );
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const HomePageDoc()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error saving prescription: ${response.body}')),
//       );
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(children: [
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('lib/images/6 Pharmacy locater-2.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SafeArea(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       padding:
//                       const EdgeInsets.only(left: 20, top: 30, right: 3, bottom: 7),
//                       child: Row(
//                         children: [
//                           const SizedBox(
//                             width: 6,
//                             height: 190,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'New Prescription',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w900,
//                                   fontSize: 26,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               const Text(
//                                 'Digital',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 13,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 40,
//                                 width: 20,
//                                 child: Image.asset('lib/images/Group 2085662530.png'),
//                               ),
//                               const SizedBox(height: 1),
//                               const Text(
//                                 'Monday 23rd, July, 2060',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               const SizedBox(height: 2),
//                               const Text(
//                                 '3:21:59pm',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             width: 46,
//                           ),
//                           SizedBox(
//                             height: 140,
//                             width: 100,
//                             child: Image.asset(
//                               'lib/images/doctor.png',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     const SizedBox(height: 25),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 35.0),
//                       child: Container(
//                         padding: const EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                             color: Colors.grey[100],
//                             borderRadius: BorderRadius.circular(9)),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Medical Center',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 14,
//                                   color: Colors.black87),
//                             ),
//                             const SizedBox(height: 1),
//                             const Text(
//                               'MD.Amber Smith',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 11,
//                               ),
//                             ),
//                             const Text(
//                               'Physiotherapist',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 11,
//                               ),
//                             ),
//                             const Text(
//                               'ID NO.236678',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 11,
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             TextField(
//                               controller: _patientNameController,
//                               decoration:
//                               InputDecoration(labelText: 'Patient Name'),
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 10,
//                               ),
//                             ),
//                             TextField(
//                               controller: _ageController,
//                               decoration: InputDecoration(labelText: 'Age'),
//                               keyboardType: TextInputType.number,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 11,
//                               ),
//                             ),
//                             TextField(
//                               controller: _addressController,
//                               decoration: InputDecoration(
//                                 labelText: 'Address',
//                               ),
//                               maxLines: null,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 11,
//                               ),
//                             ),
//
//                             TextField(
//                               controller: _medicationNameController,
//                               decoration:
//                               InputDecoration(labelText: 'Medication Name'),
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 11,
//                               ),
//                             ),
//                             TextField(
//                               controller: _dosageController,
//                               decoration: InputDecoration(labelText: 'Dosage'),
//                               keyboardType: TextInputType.number,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 11,
//                               ),
//                             ),
//                             TextField(
//                               controller: _instructionsController,
//                               decoration: InputDecoration(
//                                 labelText: 'Instructions',
//                               ),
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 11,
//                               ),
//                               maxLines: null, // or set it to a value greater than 1 if you have a specific limit
//                             ),
//
//                             const SizedBox(
//                               height: 250,
//                             ),
//
//                             Padding(
//                               padding: const EdgeInsets.only(left: 100),
//                               child: Center(
//                                 child: InkWell(
//                                   onTap: () async {
//                                     await _submitForm();
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => const HomePageDoc(),
//                                       ),
//                                     );
//                                   },
//                                   child: Container(
//                                     //padding: const EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
//                                     padding: const EdgeInsets.all(6),
//                                     width: 170,
//
//                                     decoration: BoxDecoration(
//                                       color: Colors.blueAccent,
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: const Center(
//                                       child: Text('Save and send',
//                                           style: TextStyle(
//                                               color: Colors.white, fontSize: 11)),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//
//                             // Padding(
//                             //   padding: const EdgeInsets.only(left: 100),
//                             //   child: Center(
//                             //     child: InkWell(
//                             //       onTap: () async {
//                             //         final patientName = _patientNameController.text;
//                             //         final age = int.tryParse(_ageController.text);
//                             //         final address = _addressController.text;
//                             //         final medicationName = _medicationNameController.text;
//                             //         final dosage = int.tryParse(_dosageController.text);
//                             //         final instructions = _instructionsController.text;
//                             //
//                             //         if (patientName == null || age == null || address.isEmpty || medicationName.isEmpty || dosage == null) {
//                             //           ScaffoldMessenger.of(context).showSnackBar(
//                             //             const SnackBar(content: Text('Please fill in all fields')),
//                             //           );
//                             //           return;
//                             //         }
//                             //
//                             //         final response = await http.post(
//                             //           Uri.parse('http://localhost:3000/saveprescription'),
//                             //           headers: <String, String>{
//                             //             'Content-Type': 'application/json; charset=UTF-8',
//                             //           },
//                             //           body: jsonEncode(<String, dynamic>{
//                             //             'patientName': patientName,
//                             //             'age': age,
//                             //             'address': address,
//                             //             'medicationName': medicationName,
//                             //             'dosage': dosage,
//                             //             'instructions': instructions,
//                             //           }),
//                             //         );
//                             //         if (response.statusCode == 201) {
//                             //           ScaffoldMessenger.of(context).showSnackBar(
//                             //               const SnackBar(content: Text('Prescription saved successfully')),
//                             //           );
//                             //           Navigator.push(
//                             //             context,
//                             //             MaterialPageRoute(builder: (context) => const HomePageDoc()),
//                             //           );
//                             //       } else {
//                             //       ScaffoldMessenger.of(context).showSnackBar(
//                             //           SnackBar(content: Text('Error saving prescription: ${response.body}')));}
//                             //
//                             //       },
//                             //       child: Container(
//                             //         //padding: const EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
//                             //         padding: const EdgeInsets.all(6),
//                             //         width: 170,
//                             //
//                             //         decoration: BoxDecoration(
//                             //           color: Colors.blueAccent,
//                             //           borderRadius: BorderRadius.circular(8),
//                             //         ),
//                             //         child: const Center(
//                             //           child: Text('Save and send',
//                             //               style: TextStyle(
//                             //                   color: Colors.white, fontSize: 11)),
//                             //         ),
//                             //       ),
//                             //     ),
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ))
//         ]));
//   }
// }
