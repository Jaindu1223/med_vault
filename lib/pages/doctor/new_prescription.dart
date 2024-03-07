
import 'package:flutter/material.dart';
import 'package:med_vault/pages/doctor/home_pageD.dart';
import 'package:med_vault/pages/patient/medical_record.dart';

class NewPrescription extends StatefulWidget {
  const NewPrescription({super.key});

  @override
  State<NewPrescription> createState() => _NewPrescriptionState();
}

class _NewPrescriptionState extends State<NewPrescription> {
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
                            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(9)),
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

                                    const TextField(
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
                                    const TextField(
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
                                    const TextField(
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

                                    const Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextField(
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
                                    const TextField(
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

                                    const Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextField(
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
                                    const TextField(
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

                                    const Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextField(
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
                                    const TextField(
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

                                    const TextField(
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


                                    const TextField(
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
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePageDoc()));
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
                                              child: Text(
                                                  'Save and share',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13)

                                              ),
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




