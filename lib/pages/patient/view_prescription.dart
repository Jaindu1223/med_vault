
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:med_vault/pages/doctor/home_pageD.dart';
import 'package:med_vault/pages/patient/check.dart';
import 'package:med_vault/pages/patient/home_page.dart';
import 'package:med_vault/pages/patient/medical_record.dart';
import 'package:http/http.dart' as http;
import 'package:med_vault/pages/patient/my_qr.dart';
import 'package:med_vault/pages/patient/navigation_components.dart';
import 'package:med_vault/pages/patient/pharmacy_spotter.dart';
import 'package:med_vault/pages/patient/prescribed_pharmacy_spotter.dart';
import 'package:med_vault/pages/patient/settings.dart';

class viewPrescription extends StatefulWidget {
  final String email;
  const viewPrescription({Key? key, required this.email}):super(key:key);

  @override
  State<viewPrescription> createState() => _viewPrescriptionState();
}

class _viewPrescriptionState extends State<viewPrescription> {
  int _currentIndex = 1;
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
        body: Stack(
            children:[
              Container(
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
                          padding: const EdgeInsets.only(left: 20,top: 18, right: 3, bottom: 7),
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
                              const SizedBox(width: 26,),

                              Expanded(
                                child: SizedBox(
                                  height: 94,
                                  child: Image.asset(
                                    'lib/images/medical-report-5817916_1920.png'),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.lightBlue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15), // Set the border radius
                                        ),
                                        minimumSize: const Size(130, 40),
                                      ),
                                      onPressed: isLoading ? null : searchPrescription,
                                      child: isLoading ? const CircularProgressIndicator() :
                                      const Text('Receive Prescription',
                                        style: TextStyle(
                                            color: Colors.white),),
                                    ),
                                    const SizedBox(height: 16.0),

                                    const SizedBox(height: 1),
                                    Text(
                                      'Name: Dr. $doctorName',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                    ),

                                    Text(
                                      'Speciality: $doctorSpeciality',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Text(
                                      'SLMC Registration No: $doctorSLMC',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                    ),

                                    const SizedBox(height: 9),

                                    Text(
                                      'Age: $age',
                                      style: const TextStyle(fontSize: 13.0),
                                    ),

                                    const SizedBox(height: 2),

                                    Text(
                                      'Patient Name: $patientName',
                                      style: const TextStyle(fontSize: 13.0,),
                                    ),

                                    const SizedBox(height: 2),

                                    Text(
                                      'Address: $address',
                                      style: const TextStyle(fontSize: 13.0),
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
                                                constraints: const BoxConstraints(
                                                  minHeight: 70,
                                                  minWidth: 180,
                                                  maxHeight:80,
                                                  maxWidth: 200,
                                                ),
                                                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),

                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4.0),
                                                    side: const BorderSide(width: 1.0, color: Colors.black),
                                                  ),
                                                ),
                                                padding: const EdgeInsets.only(bottom: 7,left: 7,top: 7,right: 7),
                                                child: Text(
                                                      'Medicine Name: \n$medication1Name',
                                                      style: const TextStyle(fontSize: 14),
                                                     ),
                                              ),
                                            ),

                                            const SizedBox(width: 16),

                                            Expanded(
                                              child: Container(
                                                constraints: const BoxConstraints(
                                                  minHeight: 70,
                                                  minWidth: 50,
                                                  maxHeight:80,
                                                  maxWidth: 60,
                                                ),
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4.0),
                                                    side: const BorderSide(width: 1.0, color: Colors.black),
                                                  ),
                                                ),
                                                padding: const EdgeInsets.only(bottom: 7,left: 7,top: 7,right: 7),
                                                child: Text(
                                                  'Dosage: $dosage1 mg',
                                                  style: const TextStyle(fontSize: 12.0),
                                                ),
                                              ),
                                            ),

                                            const SizedBox(width: 16),// Add some horizontal spacing between the two text fields
                                          ],
                                        ),
                                        // Add more rows for additional medications and dosages as needed
                                      ],
                                    ),

                                    const SizedBox(height: 5),
                                    Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 60,
                                        minWidth: 270,
                                        maxHeight:100,
                                        maxWidth: 270,
                                      ),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0),
                                          side: const BorderSide(width: 1.0, color: Colors.black),
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'More Details: $moreDetails1',
                                        style: const TextStyle(fontSize: 12.0),
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
                                                constraints: const BoxConstraints(
                                                  minHeight: 70,
                                                  minWidth: 180,
                                                  maxHeight:80,
                                                  maxWidth: 200,
                                                ),
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4.0),
                                                    side: const BorderSide(width: 1.0, color: Colors.black),
                                                  ),
                                                ),
                                                padding: const EdgeInsets.only(bottom: 7,left: 7,top: 7,right: 7),
                                                child: Text(
                                                  'Medicine Name: \n$medication2Name',
                                                  style: const TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ),

                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Container(
                                                constraints: const BoxConstraints(
                                                  minHeight: 70,
                                                  minWidth: 30,
                                                  maxHeight:80,
                                                  maxWidth: 40,
                                                ),
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4.0),
                                                    side: const BorderSide(width: 1.0, color: Colors.black),
                                                  ),
                                                ),
                                                padding: const EdgeInsets.only(bottom: 7,left: 7,top: 7,right: 7),
                                                child: Text(
                                                  'Dosage: $dosage2 mg',
                                                  style: const TextStyle(fontSize: 12.0),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 16),// Add some horizontal spacing between the two text fields
                                          ],
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 5),
                                    Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 60,
                                        minWidth: 270,
                                        maxHeight:100,
                                        maxWidth: 270,
                                      ),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0),
                                          side: const BorderSide(width: 1.0, color: Colors.black),
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'More Details: $moreDetails2',
                                        style: const TextStyle(fontSize: 14.0),
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
                                                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4.0),
                                                    side: const BorderSide(width: 1.0, color: Colors.black),
                                                  ),
                                                ),
                                                padding: const EdgeInsets.only(bottom: 20,left: 7,top: 7,right: 60),
                                                child: Text(
                                                  'Medicine Name: \n$medication3Name',
                                                  style: const TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ),

                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Container(
                                                constraints: const BoxConstraints(
                                                  minHeight: 70,
                                                  minWidth: 30,
                                                  maxHeight:80,
                                                  maxWidth: 40,
                                                ),
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4.0),
                                                    side: const BorderSide(width: 1.0, color: Colors.black),
                                                  ),
                                                ),

                                                padding: const EdgeInsets.only(bottom: 7,left: 7,top: 7,right: 7),
                                                child: Text(
                                                  'Dosage: $dosage3 mg',
                                                  style: const TextStyle(fontSize: 12.0),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 16),// Add some horizontal spacing between the two text fields
                                          ],
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 5),
                                    Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 60,
                                        minWidth: 270,
                                        maxHeight:100,
                                        maxWidth: 270,
                                      ),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0),
                                          side: const BorderSide(width: 1.0, color: Colors.black),
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'More Details: $moreDetails3',
                                        style: const TextStyle(fontSize: 14.0),
                                      ),
                                    ),

                                    const SizedBox(height: 35),

                                    Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 100,
                                        minWidth: 300,
                                        maxHeight:120,
                                        maxWidth: 300,
                                      ),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0),
                                          side: const BorderSide(width: 1.0, color: Colors.black),
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(left: 10,top: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Additional Details: $additional',
                                            style: const TextStyle(fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 15),

                                    Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 100,
                                        minWidth: 300,
                                        maxHeight:120,
                                        maxWidth: 400,
                                      ),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0),
                                          side: const BorderSide(width: 1.0, color: Colors.black),
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
                                            style: const TextStyle(fontSize: 14.0),
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

