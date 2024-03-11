
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_vault/pages/doctor/home_pageD.dart';
import 'package:med_vault/pages/patient/medical_record.dart';
import 'package:http/http.dart' as http;

class viewPrescription extends StatefulWidget {
  const viewPrescription({super.key});

  @override
  State<viewPrescription> createState() => _viewPrescriptionState();
}

class _viewPrescriptionState extends State<viewPrescription> {

  final _emailController = TextEditingController();
  bool isLoading = false;
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

    final String email = _emailController.text.toLowerCase();

    print('prescription: $email');
    try {

      final Uri url = Uri.parse('http://10.0.2.2:3000/email/$email');

      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[100],
        body: Stack(
            children:[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'lib/images/6 Pharmacy locater-2.png'),
                    fit: BoxFit.cover,
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
                                    'New Prescription',
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
                                  const Text(
                                    'Monday 23rd, July, 2060',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  const Text(
                                    '3:21:59pm',
                                    style: TextStyle(
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


                            ],),
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
                                    const Text(
                                      'Medical Center',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Colors.black87
                                      ),
                                    ),
                                    const SizedBox(height: 1),
                                    const Text(
                                      'MD.Amber Smith',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                    ),

                                    const Text(
                                      'Physiotherapist',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                    ),
                                    const Text(
                                      'ID NO.236678',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    TextField(
                                      controller: _emailController,
                                      decoration:  InputDecoration(
                                        labelText: 'Enter your NIC',
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: isLoading ? null : searchPrescription,
                                      child: isLoading ? CircularProgressIndicator() : Text('Search prescrption'),
                                    ),
                                    SizedBox(height: 16.0),

                                    Text(
                                      'Patient Name: $patientName',
                                      style: TextStyle(fontSize: 16.0),
                                    ),


                                    const SizedBox(height: 5),

                                    Text(
                                      'Age: $age',
                                      style: TextStyle(fontSize: 16.0),
                                    ),


                                    const SizedBox(height: 20),
                                    Text(
                                      'Address: $address',
                                      style: TextStyle(fontSize: 16.0),
                                    ),

                                    const SizedBox(height: 20),
                                    const Text(
                                      '1st Medicine',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.black87
                                      ),
                                    ),
                                    const SizedBox(height: 5),

                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4.0),
                                                    side: BorderSide(width: 1.0, color: Colors.black),
                                                  ),
                                                  //color: Colors.white,
                                                ),

                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Medicine Name: $medication1Name',
                                                  style: TextStyle(fontSize: 12.0),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16),

                                            Expanded(
                                              child: Container(
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4.0),
                                                    side: BorderSide(width: 1.0, color: Colors.black),
                                                  ),
                                                  //color: Colors.white,
                                                ),

                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Dosage: $dosage1',
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
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    ),

                                    const SizedBox(height: 15),
                                    const Text(
                                      '2nd Medicine',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.black87
                                      ),
                                    ),
                                    const SizedBox(height: 5),

                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4.0),
                                                    side: BorderSide(width: 1.0, color: Colors.black),
                                                  ),
                                                  //color: Colors.white,
                                                ),

                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Medicine Name: $medication2Name',
                                                  style: TextStyle(fontSize: 12.0),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Expanded(
                                              child: Container(
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4.0),
                                                    side: BorderSide(width: 1.0, color: Colors.black),
                                                  ),
                                                  //color: Colors.white,
                                                ),

                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Dosage: $dosage2',
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

                                    const SizedBox(height: 15),
                                    const Text(
                                      '3rd Medicine',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.black87
                                      ),
                                    ),
                                    const SizedBox(height: 5),

                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4.0),
                                                    side: BorderSide(width: 1.0, color: Colors.black),
                                                  ),
                                                  //color: Colors.white,
                                                ),

                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Medicine Name: $medication3Name',
                                                  style: TextStyle(fontSize: 12.0),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Expanded(
                                              child: Container(
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(4.0),
                                                    side: BorderSide(width: 1.0, color: Colors.black),
                                                  ),
                                                  //color: Colors.white,
                                                ),

                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Dosage: $dosage3',
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
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0),
                                          side: BorderSide(width: 1.0, color: Colors.black),
                                        ),
                                        //color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.all(30.0),
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
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0),
                                          side: BorderSide(width: 1.0, color: Colors.black),
                                        ),
                                        //color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.all(30.0),
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


                                    const SizedBox(height: 50,),

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
        )
    );

  }
}

