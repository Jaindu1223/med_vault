
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_vault/pages/doctor/doc_pharmacy_spotter.dart';
import 'package:med_vault/pages/doctor/doc_settings.dart';
import 'package:med_vault/pages/doctor/home_pageD.dart';
import 'package:med_vault/pages/doctor/qr_scan.dart';
import 'package:med_vault/pages/patient/check.dart';
import 'package:med_vault/pages/patient/home_page.dart';
import 'package:med_vault/pages/patient/medical_record.dart';
import 'package:http/http.dart' as http;
import 'package:med_vault/pages/patient/my_qr.dart';
import 'package:med_vault/pages/patient/navigation_components.dart';
import 'package:med_vault/pages/patient/pharmacy_spotter.dart';
import 'package:med_vault/pages/patient/prescribed_pharmacy_spotter.dart';
import 'package:med_vault/pages/patient/settings.dart';

import 'navigation_components_doc.dart';

class docViewPrescription extends StatefulWidget {

  final String email;
  final String docemail;
  const docViewPrescription({Key? key, required this.email,required this.docemail}) : super(key: key);

  @override
  State<docViewPrescription> createState() => _docViewPrescriptionState();
}

class _docViewPrescriptionState extends State<docViewPrescription> {
  int _currentIndexD = 2;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });

  // switch (index) {
  //   case 0:
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => PharmacySearchPage1()),
  //     );
  //     break;
  //   case 1:
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => viewPrescription(email: widget.email)),
  //     );
  //     break;
  //   case 2:
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => MyQR(email: widget.email)),
  //     );
  //     break;
  //   case 3:
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => PatientProfile()),
  //     );
  //     break;
  // }
  // }


  final _emailController = TextEditingController();
  bool isLoading = false;
  String doctorName = '';
  String doctorSpeciality = '';
  String doctorSLMC = '';
  String patientName = '';
  int age =0;
  String address = '';
  String medication1Name='';
  int dosage1=0;
  String moreDetails1='';
  String medication2Name='';
  int dosage2=0;
  String moreDetails2='';
  String medication3Name='';
  int dosage3=0;
  String moreDetails3='';
  String additional='';
  String instructions='';


  Future<void> searchPrescription() async {
    setState(() {
      isLoading = true;
    });

    // final String email = _emailController.text.toLowerCase();

    final String email = widget.email;

    print('prescription: $email');
    try {

      final Uri url = Uri.parse('https://medvault-backend-wv3ggtvglq-uc.a.run.app/email/$email');

      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData);

        final dynamic doctorNameValue = responseData['docName'];
        final dynamic doctorSpecialityValue = responseData['docSpeciality'];
        final dynamic doctorSLMCValue = responseData['docSLMC'];

        final dynamic patientNameValue = responseData['patientName'];
        final dynamic ageValue = responseData['age'];
        final dynamic addressValue = responseData['address'];

        final dynamic medication1Value = responseData['medication1Name'];
        final dynamic dosage1Value = responseData['dosage1'];
        final dynamic moreDetails1Value = responseData['moreDetails1'];

        final dynamic medication2Value = responseData['medication2Name'];
        final dynamic dosage2Value = responseData['dosage2'];
        final dynamic moreDetails2Value = responseData['moreDetails2'];

        final dynamic medication3Value = responseData['medication3Name'];
        final dynamic dosage3Value = responseData['dosage3'];
        final dynamic moreDetails3Value = responseData['moreDetails3'];

        final dynamic additionalValue = responseData['additional'];
        final dynamic instructionsValue = responseData['instructions'];



        if (patientNameValue == null || patientNameValue is! String) {
          setState(() {
            patientName = '$email is not available';
            isLoading = false;
          });
          return;
        } else {
          setState(() {
            doctorName = doctorNameValue;
            doctorSpeciality = doctorSpecialityValue;
            doctorSLMC = doctorSLMCValue;
            patientName = patientNameValue;
            age = ageValue;
            address = addressValue;
            medication1Name =medication1Value;
            dosage1 = dosage1Value;
            moreDetails1 = moreDetails1Value;
            medication2Name = medication2Value;
            dosage2 = dosage2Value;
            moreDetails2 = moreDetails2Value;
            medication3Name = medication3Value;
            dosage3 = dosage3Value;
            moreDetails3 = moreDetails3Value;
            additional = additionalValue;
            instructions = instructionsValue;
            isLoading = false;
          });


        };
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        //patientName = 'Error occurred';
        isLoading = false;
      });
    }
  }

  void navigaetToPharmacySearch(String medicineName){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrescribedPharmacySearchPage(medicineName: medicineName),
      ),
    );
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
      //backgroundColor: Colors.blue[100],
      body: Stack(
          children:[
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
            SafeArea(
                child:SingleChildScrollView(
                  child:Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20,top: 30, right: 3, bottom: 7),
                        child: Row(
                          children: [
                            const SizedBox(width: 6,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                const Text(
                                  'My Prescription',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 26,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  'Digital',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),

                                ),
                                SizedBox(
                                  height: 40,
                                  width: 20,
                                  child: Image.asset(
                                      'lib/images/Group 2085662530.png'),

                                  //color: Colors.limeAccent,
                                ),
                                const SizedBox(height: 1),
                                Text(
                                  formattedDate,
                                  style: const TextStyle(
                                    fontSize: 12,
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
                              ],
                            ),
                            const SizedBox(width: 46,),

                            SizedBox(
                              height: 140,
                              width: 100,
                              child: Image.asset(
                                'lib/images/doctor.png',),

                              //color: Colors.limeAccent,
                            ),
                          ],
                        ),
                      ),

                      //search bar

                      //categories(horizontal list)
                      const SizedBox(height: 25),

                      //box
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(9)),
                          child: Row(children: [
                            Expanded(
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Center(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.lightBlue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15), // Set the border radius
                                        ),
                                        minimumSize: Size(130, 40),
                                        // Set the background color to blue
                                      ),
                                      onPressed: isLoading ? null : searchPrescription,
                                      child: isLoading ? CircularProgressIndicator() :
                                      Text('Receive Prescription',
                                        style: TextStyle(
                                            color: Colors.white),),
                                    ),
                                  ),
                                  SizedBox(height: 16.0),

                                  const SizedBox(height: 1),
                                  Text(
                                    'Name: Dr. $doctorName',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                  ),

                                  Text(
                                    'Speciality: $doctorSpeciality',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    'SLMC Registration No: $doctorSLMC',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                  ),

                                  const SizedBox(height: 9),

                                  Text(
                                    'Age: $age',
                                    style: TextStyle(fontSize: 14.0),
                                  ),


                                  const SizedBox(height: 2),

                                  Text(
                                    'Patient Name: $patientName',
                                    style: TextStyle(fontSize: 14.0,),
                                  ),

                                  const SizedBox(height: 2),
                                  Text(
                                    'Address: $address',
                                    style: TextStyle(fontSize: 14.0),
                                  ),

                                  const Text('-----------------------------------------------------------------'),
                                  Center(
                                      child: Text(
                                        'Click on medicine boxes to find the nearest pharmacy!!',
                                        style: TextStyle(fontSize: 12.0, color: Colors.blue[800]),
                                        textAlign: TextAlign.center,

                                      )),
                                  const SizedBox(height: 20),

                                  const Text(
                                    '1st Medicine',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black87
                                    ),
                                  ),
                                  const SizedBox(height: 5),

                                  Column(
                                    children: [
                                      Row(
                                        children: [

                                          GestureDetector(
                                            onTap: () {
                                              navigaetToPharmacySearch(medication1Name);
                                            },
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 70,
                                                minWidth: 180,
                                                maxHeight:80,
                                                maxWidth: 200,
                                              ),
                                              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),

                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(width: 1.0, color: Colors.black),
                                                ),
                                                //color: Colors.white,
                                              ),

                                              //padding: const EdgeInsets.all(8),
                                              padding: const EdgeInsets.only(bottom: 7,left: 7,top: 7,right: 7),
                                              child: Text(
                                                'Medicine Name: \n$medication1Name',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),

                                          ),

                                          SizedBox(width: 16),

                                          Expanded(
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 70,
                                                minWidth: 50,
                                                maxHeight:80,
                                                maxWidth: 60,
                                              ),
                                              //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(width: 1.0, color: Colors.black),
                                                ),
                                                //color: Colors.white,
                                              ),
                                              //padding: EdgeInsets.all(8),

                                              //padding: const EdgeInsets.all(14.0),
                                              padding: const EdgeInsets.only(bottom: 7,left: 7,top: 7,right: 7),
                                              child: Text(
                                                'Dosage: $dosage1 mg',
                                                style: TextStyle(fontSize: 12.0),
                                              ),
                                            ),
                                          ),



                                          SizedBox(width: 16),// Add some horizontal spacing between the two text fields


                                        ],
                                      ),
                                      // Add more rows for additional medications and dosages as needed
                                    ],
                                  ),

                                  const SizedBox(height: 5),
                                  Container(
                                    constraints: BoxConstraints(
                                      minHeight: 60,
                                      minWidth: 270,
                                      maxHeight:100,
                                      maxWidth: 270,
                                    ),

                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        side: BorderSide(width: 1.0, color: Colors.black),
                                      ),
                                      //color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'More Details: $moreDetails1',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ),

                                  const SizedBox(height: 28),
                                  const Text(
                                    '2nd Medicine',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black87
                                    ),
                                  ),
                                  const SizedBox(height: 5),

                                  Column(
                                    children: [
                                      Row(
                                        children: [

                                          GestureDetector(
                                            onTap: () {
                                              navigaetToPharmacySearch(medication2Name);
                                            },
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 70,
                                                minWidth: 180,
                                                maxHeight:80,
                                                maxWidth: 200,
                                              ),
                                              //margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),

                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(width: 1.0, color: Colors.black),
                                                ),
                                                //color: Colors.white,
                                              ),

                                              //padding: const EdgeInsets.all(8),
                                              padding: const EdgeInsets.only(bottom: 7,left: 7,top: 7,right: 7),
                                              child: Text(
                                                'Medicine Name: \n$medication2Name',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),


                                            // Container(
                                            //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                            //   padding: EdgeInsets.all(10),
                                            //   decoration: BoxDecoration(
                                            //     borderRadius: BorderRadius.circular(10),
                                            //     color: Colors.blue[50],
                                            //   ),
                                            //   child: Text(
                                            //     'Medicine Name: \n$medication2Name',
                                            //     style: TextStyle(fontSize: 15),
                                            //   ),
                                            // ),
                                          ),

                                          // Expanded(
                                          //   child: Container(
                                          //     decoration: ShapeDecoration(
                                          //       shape: RoundedRectangleBorder(
                                          //         borderRadius: BorderRadius.circular(4.0),
                                          //         side: BorderSide(width: 1.0, color: Colors.black),
                                          //       ),
                                          //       //color: Colors.white,
                                          //     ),
                                          //
                                          //     padding: const EdgeInsets.all(8.0),
                                          //     child: Text(
                                          //       'Medicine Name: $medication2Name',
                                          //       style: TextStyle(fontSize: 12.0),
                                          //     ),
                                          //   ),
                                          // ),

                                          SizedBox(width: 16),
                                          Expanded(
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 70,
                                                minWidth: 30,
                                                maxHeight:80,
                                                maxWidth: 40,
                                              ),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(width: 1.0, color: Colors.black),
                                                ),
                                                //color: Colors.white,
                                              ),

                                              padding: const EdgeInsets.only(bottom: 7,left: 7,top: 7,right: 7),
                                              child: Text(
                                                'Dosage: $dosage2 mg',
                                                style: TextStyle(fontSize: 12.0),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 16),// Add some horizontal spacing between the two text fields


                                        ],
                                      ),
                                      // Add more rows for additional medications and dosages as needed
                                    ],
                                  ),

                                  const SizedBox(height: 5),
                                  Container(
                                    constraints: BoxConstraints(
                                      minHeight: 60,
                                      minWidth: 270,
                                      maxHeight:100,
                                      maxWidth: 270,
                                    ),
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        side: BorderSide(width: 1.0, color: Colors.black),
                                      ),
                                      //color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'More Details: $moreDetails2',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ),

                                  const SizedBox(height: 28),
                                  const Text(
                                    '3rd Medicine',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black87
                                    ),
                                  ),
                                  const SizedBox(height: 5),

                                  Column(
                                    children: [
                                      Row(
                                        children: [

                                          GestureDetector(
                                            onTap: () {
                                              navigaetToPharmacySearch(medication3Name);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),

                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(width: 1.0, color: Colors.black),
                                                ),
                                                //color: Colors.white,
                                              ),

                                              //padding: const EdgeInsets.all(8),
                                              padding: const EdgeInsets.only(bottom: 20,left: 7,top: 7,right: 60),
                                              child: Text(
                                                'Medicine Name: \n$medication3Name',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          // child: Container(
                                          //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                          //   padding: EdgeInsets.all(10),
                                          //   decoration: BoxDecoration(
                                          //     borderRadius: BorderRadius.circular(10),
                                          //     color: Colors.blue[50],
                                          //   ),
                                          //   child: Text(
                                          //     'Medicine Name: \n$medication3Name',
                                          //     style: TextStyle(fontSize: 16),
                                          //   ),
                                          // ),


                                          // Expanded(
                                          //   child: Container(
                                          //     decoration: ShapeDecoration(
                                          //       shape: RoundedRectangleBorder(
                                          //         borderRadius: BorderRadius.circular(4.0),
                                          //         side: BorderSide(width: 1.0, color: Colors.black),
                                          //       ),
                                          //       //color: Colors.white,
                                          //     ),
                                          //
                                          //     padding: const EdgeInsets.all(8.0),
                                          //     child: Text(
                                          //       'Medicine Name: $medication3Name',
                                          //       style: TextStyle(fontSize: 12.0),
                                          //     ),
                                          //   ),
                                          // ),
                                          SizedBox(width: 16),
                                          Expanded(
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 70,
                                                minWidth: 30,
                                                maxHeight:80,
                                                maxWidth: 40,
                                              ),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  side: BorderSide(width: 1.0, color: Colors.black),
                                                ),
                                                //color: Colors.white,
                                              ),

                                              padding: const EdgeInsets.only(bottom: 7,left: 7,top: 7,right: 7),
                                              child: Text(
                                                'Dosage: $dosage3 mg',
                                                style: TextStyle(fontSize: 12.0),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 16),// Add some horizontal spacing between the two text fields


                                        ],
                                      ),

                                      // Add more rows for additional medications and dosages as needed
                                    ],
                                  ),

                                  const SizedBox(height: 5),
                                  Container(
                                    constraints: BoxConstraints(
                                      minHeight: 60,
                                      minWidth: 270,
                                      maxHeight:100,
                                      maxWidth: 270,
                                    ),
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        side: BorderSide(width: 1.0, color: Colors.black),
                                      ),
                                      //color: Colors.white,
                                    ),

                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'More Details: $moreDetails3',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ),

                                  const SizedBox(height: 35),

                                  Container(
                                    constraints: BoxConstraints(
                                      minHeight: 100,
                                      minWidth: 300,
                                      maxHeight:120,
                                      maxWidth: 300,
                                    ),
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        side: BorderSide(width: 1.0, color: Colors.black),
                                      ),
                                      //color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.only(left: 10,top: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Additional Details: $additional',
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15),


                                  Container(
                                    constraints: BoxConstraints(
                                      minHeight: 100,
                                      minWidth: 300,
                                      maxHeight:120,
                                      maxWidth: 400,
                                    ),
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        side: BorderSide(width: 1.0, color: Colors.black),
                                      ),
                                      //color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.only(left: 10,top: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Instructions: $instructions',
                                          style: TextStyle(fontSize: 14.0),
                                        ),


                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 30),

                                  Center(
                                      child: Text(
                                        'Click on medicine boxes to find the nearest pharmacy!!',
                                        style: TextStyle(fontSize: 12.0, color: Colors.blue[800]),
                                        textAlign: TextAlign.center,

                                      ))


                                  // const SizedBox(height: 50,),

                                ],
                              ),
                            )
                          ],),
                        ),
                      ),


                      const SizedBox(height: 25),




                    ],
                  ),


                )
            )
          ]
      ),

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
                  PharmacySearchPage2(email: widget.email, docemail: widget.docemail),
                  context);
              break;
            case 2:
              NavigationServiceDoc.navigateTo(
                  QrScan(email: widget.email,docemail: widget.docemail),
                  context); // Already on QrScan page, no need to navigate
              break;
            case 3:
              NavigationServiceDoc.navigateTo(
                  docSettingsPage(email: widget.email, docemail: widget.docemail),
                  context);
              break;
          }
        },
      ),

      //   bottomNavigationBar: BottomNavigationBar(
      //   //backgroundColor: Colors.lightBlue, // Set background color here
      //   unselectedItemColor: Colors.black, // Set icon color here
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home Page',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search_outlined),
      //       label: 'Pharmacy Finder',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.qr_code),
      //       label: 'My QR',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.blueAccent,
      //   onTap: _onItemTapped,
      // ),
    );

  }
}

