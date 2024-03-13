
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:med_vault/pages/doctor/home_pageD.dart';
import 'package:med_vault/pages/patient/medical_record.dart';
import 'package:http/http.dart' as http;

class NewPrescription extends StatefulWidget {
  final String? email;
  const NewPrescription({Key? key, this.email}) : super(key: key);

  @override
  _NewPrescriptionState  createState() => _NewPrescriptionState();
}

class _NewPrescriptionState extends State<NewPrescription> {
  final _patientNameController = TextEditingController();
  final _patientNICController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();

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

  Future<void> _submitForm() async {
    final patientName = _patientNameController.text;
    final patientNIC = _patientNICController.text;
    final age = int.tryParse(_ageController.text);
    final address = _addressController.text;

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

    if (patientName == null || age == null || address.isEmpty || medication1Name.isEmpty || dosage1 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/saveprescription'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'patientName': patientName,
        'patientNIC': patientNIC,
        'age': age,
        'address': address,
        'medication1Name': medication1Name,
        'dosage1': dosage1,
        'moreDetails1': moreDetails1,
        'medication2Name': medication2Name,
        'dosage2': dosage2,
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
        MaterialPageRoute(builder: (context) => const HomePageDoc()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving prescription: ${response.body}')),
      );
    }
  }


  @override
  void initState() {
    super.initState();
    if (widget.email != null) {
      _patientNICController.text = widget.email!;
    }}

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
                                      controller: _patientNameController,
                                      decoration:  InputDecoration(
                                          labelText: 'Patient Name',
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
                                    const SizedBox(height: 5),
                                    TextField(
                                      controller: _patientNICController,
                                      decoration:  InputDecoration(
                                        labelText: 'email(nic)',
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
                                    const SizedBox(height: 5),
                                    TextField(
                                      controller: _ageController,
                                      decoration:  InputDecoration(
                                          labelText: 'Age',
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                        ),),
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),

                                    const SizedBox(height: 5),
                                    TextField(
                                      controller: _addressController,
                                      decoration:  InputDecoration(
                                          labelText: 'Address',
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                        ),
                                      ),
                                      maxLines: null,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
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
                                                decoration: InputDecoration(
                                                  labelText: 'Medicine Name',
                                                  hintText: 'Enter the Name',
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16), // Add some horizontal spacing between the two text fields

                                            Expanded(
                                              child: TextField(
                                                controller: _dosage1Controller,
                                                decoration: InputDecoration(
                                                  labelText: 'Dosage (mg)',
                                                  hintText: 'Enter the Dosage',
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                keyboardType: TextInputType.number,
                                                style: TextStyle(
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
                                      decoration: InputDecoration(
                                        labelText: 'More details',
                                        hintText: 'Enter Additional Details',
                                        border: OutlineInputBorder(),
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                      style: TextStyle(
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
                                                decoration: InputDecoration(
                                                  labelText: 'Medicine Name',
                                                  hintText: 'Enter the Name',
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16), // Add some horizontal spacing between the two text fields

                                            Expanded(
                                              child: TextField(
                                                controller: _dosage2Controller,
                                                decoration: InputDecoration(
                                                  labelText: 'Dosage (mg)',
                                                  hintText: 'Enter the Dosage',
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                keyboardType: TextInputType.number,
                                                style: TextStyle(
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
                                      decoration: InputDecoration(
                                        labelText: 'More details',
                                        hintText: 'Enter Additional Details',
                                        border: OutlineInputBorder(),
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                      style: TextStyle(
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
                                                decoration: InputDecoration(
                                                  labelText: 'Medicine Name',
                                                  hintText: 'Enter the Name',
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16), // Add some horizontal spacing between the two text fields

                                            Expanded(
                                              child: TextField(
                                                controller: _dosage3Controller,
                                                decoration: InputDecoration(
                                                  labelText: 'Dosage (mg)',
                                                  hintText: 'Enter the Dosage',
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                keyboardType: TextInputType.number,
                                                style: TextStyle(
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
                                      decoration: InputDecoration(
                                        labelText: 'More details',
                                        hintText: 'Enter Additional Details',
                                        border: OutlineInputBorder(),
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),

                                    const SizedBox(height: 35),

                                    TextField(
                                      controller: _additionalController,
                                      decoration:  InputDecoration(
                                          labelText: 'Additional Notes',
                                        border: OutlineInputBorder(),
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                    ),
                                    const SizedBox(height: 15),


                                    TextField(
                                      controller: _instructionsController,
                                      decoration:  InputDecoration(
                                          labelText: 'Instructions',
                                        border: OutlineInputBorder(),
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                    ),




                                    const SizedBox(height: 50,),




                                    /*Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: Center(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const MedicalRecord()));
                                    },

                                    child: Container(

                                      //padding: const EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
                                      padding: const EdgeInsets.all(7),
                                      width: 170,


                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                        child: Text(
                                            "Patient's History",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11)

                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),*/

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
              )
            ]
        )
    );

  }
}

