
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_vault/pages/doctor/doc_pharmacy_spotter.dart';
import 'package:med_vault/pages/doctor/doc_settings.dart';
import 'package:med_vault/pages/doctor/home_pageD.dart';
import 'package:med_vault/pages/doctor/navigation_components_doc.dart';
import 'package:med_vault/pages/doctor/qr_scan.dart';
import 'package:med_vault/pages/patient/medical_record.dart';
import 'package:http/http.dart' as http;

class NewPrescription extends StatefulWidget {
  final String email;
  final String docemail;
  // const NewPrescription({Key? key, required this.email}):super(key:key);
  const NewPrescription({Key? key,  required this.email,required this.docemail}):super(key:key);

  @override
  _NewPrescriptionState  createState() => _NewPrescriptionState();
}

class _NewPrescriptionState extends State<NewPrescription> {
  int _currentIndexD = 2;



  String _doctorName = "";
  String _doctorSLMC = '';
  String _doctorSpeciality = '';

  String _patientAge = '';
  String _patientName = '';
  String _patientEmail = '';
  String _patientAddress = '';


  final _medication1NameController = TextEditingController();
  final _dosage1Controller = TextEditingController();
  final _moreDetails1Controller = TextEditingController();

  final _medication2NameController = TextEditingController();
  final _dosage2Controller = TextEditingController();
  final _moreDetails2Controller = TextEditingController();

  final _medication3NameController = TextEditingController();
  final _dosage3Controller = TextEditingController();
  final _moreDetails3Controller = TextEditingController();

  final _additionalController = TextEditingController();
  final _instructionsController = TextEditingController();

  bool _isPatientDataLoaded = false;
  bool _isDoctorDataLoaded = false;

  @override
  void initState() {
    super.initState();
    // _patientEmailController.text = widget.email;
    fetchDoctorData(widget.docemail);
    fetchPatientData(widget.email);
  }

  Future<void> fetchDoctorData(String doctorEmail) async {
    try {

        final res2 = await http.get(Uri.parse('https://medvault-backend-wv3ggtvglq-uc.a.run.app/getDoctorData?email=$doctorEmail'));

        if (res2.statusCode == 200)    {
        setState(() {
          Map<String, dynamic> responseData2 = jsonDecode(res2.body);
          print(responseData2);
          _doctorName = responseData2['docName'];
          _doctorSLMC = responseData2['docSLMC'];
          _doctorSpeciality = responseData2['docSpeciality'];
          _isDoctorDataLoaded = true;
          _submitFormIfDataLoaded();
        });
      }else {
          print('Failed to fetch doctor data');
        }

    } catch (error) {
      print('Error: $error');
    }
  }


  Future<void> fetchPatientData(String patientEmail) async {
    final response = await http.get(
      Uri.parse('https://medvault-backend-wv3ggtvglq-uc.a.run.app/getPatientData?email=$patientEmail'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {


        _patientAge = (data['patAge'] ?? 0).toString();
        _patientEmail = patientEmail;
        _patientName = data['patName'];
        _patientAddress = data['patAddress'];
        _isPatientDataLoaded = true;
        _submitFormIfDataLoaded();
      });
    } else {
      print('Failed to fetch patient data');
    }
  }

  void _submitFormIfDataLoaded() {
    if (_isPatientDataLoaded && _isDoctorDataLoaded) {
      _submitForm();
    }
  }

  Future<void> _submitForm() async {

    final String patientEmail = widget.email;


    final medication1Name = _medication1NameController.text;
    final dosage1 = int.tryParse(_dosage1Controller.text);
    final moreDetails1= _moreDetails1Controller.text;

    final medication2Name = _medication2NameController.text;
    final dosage2 = int.tryParse(_dosage2Controller.text);
    final moreDetails2= _moreDetails2Controller.text;

    final medication3Name = _medication3NameController.text;
    final dosage3 = int.tryParse(_dosage3Controller.text);
    final moreDetails3= _moreDetails3Controller.text;

    final additional = _additionalController.text;
    final instructions = _instructionsController.text;

    if (_medication1NameController.text.isEmpty &&
        _dosage1Controller.text.isEmpty &&
        _moreDetails1Controller.text.isEmpty &&
        _medication2NameController.text.isEmpty &&
        _dosage2Controller.text.isEmpty &&
        _moreDetails2Controller.text.isEmpty &&
        _medication3NameController.text.isEmpty &&
        _dosage3Controller.text.isEmpty &&
        _moreDetails3Controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter at least one medicine detail')),
      );
      return; // Exit the method without saving the prescription
    }


    final response = await http.post(
      Uri.parse('https://medvault-backend-wv3ggtvglq-uc.a.run.app/saveprescription'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'docName': _doctorName,
        'docSpeciality': _doctorSpeciality,
        'docSLMC': _doctorSLMC,
        'patientName': _patientName,
        'email': _patientEmail,
        'age': _patientAge,
        'address': _patientAddress,
        'medication1Name': medication1Name,
        'dosage1': dosage1,
        'moreDetails1': moreDetails1,
        'medication2Name': medication2Name,
        'dosage2':dosage2,
        'moreDetails2': moreDetails2,
        'medication3Name': medication3Name,
        'dosage3': dosage3,
        'moreDetails3': moreDetails3,
        'instructions': instructions,
        'additional': additional,
      }),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Prescription saved successfully')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePageDoc(email: widget.email,docemail: widget.docemail)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving prescription: ${response.body}')),
      );
    }
  }




  Widget build(BuildContext context) {
    print('docemail: ${widget.docemail}');
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE d MMMM, y')
        .format(now); // Format: Monday 23 July, 2022
    String formattedTime = DateFormat.jm().format(now); // Format: 3:21:59 PM
    Color customBackgroundColor = Color(int.parse('0xFFE3E4E4'));
    return Scaffold(
      backgroundColor: customBackgroundColor,
    //     appBar: AppBar(
    // ),
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
              SingleChildScrollView(
                child:Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20,top: 50, right: 3, bottom: 7),
                      child: Row(
                        children: [
                          const SizedBox(width: 6,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              const Text(
                                'New Prescription.',
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
                          const SizedBox(width: 13,),

                          Expanded(
                            child: SizedBox(
                              height: 140,
                              width: 100,
                              child: Image.asset(
                                'lib/images/doctor-2027615_1920.png',),

                              //color: Colors.limeAccent,
                            ),
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
                                  'Medical Center ' ,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.black87
                                  ),
                                ),
                                const SizedBox(height: 1),
                                Text(
                                  // 'MD.Amber Smith',
                                  'Name: Dr.$_doctorName',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  ),
                                ),

                                Text(
                                  'Speciality: $_doctorSpeciality',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  ),
                                ),
                                Text(
                                  'SLMC Registration No: $_doctorSLMC',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  // 'MD.Amber Smith',
                                  'Patient Name: $_patientName',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 2),


                                Text(
                                  // 'MD.Amber Smith',
                                  'Patient Email: $_patientEmail',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 2),

                                Text(
                                  // 'MD.Amber Smith',
                                  'Patient Age: $_patientAge',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),

                                const SizedBox(height: 2),

                                Text(
                                  // 'MD.Amber Smith',
                                  'Patient Address: $_patientAddress',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
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
                                          child: TextField(
                                            controller: _medication1NameController,
                                            decoration: const InputDecoration(
                                              labelText: 'Medicine Name',
                                              hintText: 'Enter the Name',
                                              border: OutlineInputBorder(),
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                              ),
                                            ),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 16), // Add some horizontal spacing between the two text fields

                                        Expanded(
                                          child: TextField(
                                            controller: _dosage1Controller,
                                            decoration: const InputDecoration(
                                              labelText: 'Dosage (mg)',
                                              hintText: 'Enter the Dosage',
                                              border: OutlineInputBorder(),
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Add more rows for additional medications and dosages as needed
                                  ],
                                ),

                                const SizedBox(height: 5),
                                TextField(
                                  controller: _moreDetails1Controller,
                                  decoration: const InputDecoration(
                                    labelText: 'More details',
                                    hintText: 'Enter Additional Details',
                                    border: OutlineInputBorder(),
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
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
                                          child: TextField(
                                            controller: _medication2NameController,
                                            decoration: const InputDecoration(
                                              labelText: 'Medicine Name',
                                              hintText: 'Enter the Name',
                                              border: OutlineInputBorder(),
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                              ),
                                            ),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 16), // Add some horizontal spacing between the two text fields

                                        Expanded(
                                          child: TextField(
                                            controller: _dosage2Controller,
                                            decoration: const InputDecoration(
                                              labelText: 'Dosage (mg)',
                                              hintText: 'Enter the Dosage',
                                              border: OutlineInputBorder(),
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Add more rows for additional medications and dosages as needed
                                  ],
                                ),

                                const SizedBox(height: 5),
                                TextField(
                                  controller: _moreDetails2Controller,
                                  decoration: const InputDecoration(
                                    labelText: 'More details',
                                    hintText: 'Enter Additional Details',
                                    border: OutlineInputBorder(),
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
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
                                          child: TextField(
                                            controller: _medication3NameController,
                                            decoration: const InputDecoration(
                                              labelText: 'Medicine Name',
                                              hintText: 'Enter the Name',
                                              border: OutlineInputBorder(),
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                              ),
                                            ),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 16), // Add some horizontal spacing between the two text fields

                                        Expanded(
                                          child: TextField(
                                            controller: _dosage3Controller,
                                            decoration: const InputDecoration(
                                              labelText: 'Dosage (mg)',
                                              hintText: 'Enter the Dosage',
                                              border: OutlineInputBorder(),
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Add more rows for additional medications and dosages as needed
                                  ],
                                ),

                                const SizedBox(height: 5),
                                TextField(
                                  controller: _moreDetails3Controller,
                                  decoration: const InputDecoration(
                                    labelText: 'More details',
                                    hintText: 'Enter Additional Details',
                                    border: OutlineInputBorder(),
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),

                                const SizedBox(height: 35),

                                TextField(
                                  controller: _additionalController,
                                  decoration:  const InputDecoration(
                                      labelText: 'Additional Notes',
                                    border: OutlineInputBorder(),
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  ),
                                ),
                                const SizedBox(height: 15),


                                TextField(
                                  controller: _instructionsController,
                                  decoration:  const InputDecoration(
                                      labelText: 'Instructions',
                                    border: OutlineInputBorder(),
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  ),
                                ),

                                const SizedBox(height: 50,),

                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () async {
                                        await _submitForm();
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) => const HomePageDoc(),
                                        //   ),
                                        // );
                                      },
                                      child: Container(
                                        //padding: const EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
                                        padding: const EdgeInsets.all(6),
                                        width: 170,

                                        decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Center(
                                          child: Text('Save and share',
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 11)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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

