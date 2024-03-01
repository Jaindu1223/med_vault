
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
                    //height: double.infinity,
                    //width: double.infinity,
                  ),
                ),
              ),
              SafeArea(
                child:SingleChildScrollView(
                 child:Column(
                   children: [

                  Container(

                    /*decoration: BoxDecoration(
                color: Colors.lightBlue
              ),*/


                    padding: const EdgeInsets.only(left: 20,top: 30, right: 3, bottom: 7),
                    child: Row(
                      children: [

                      const SizedBox(width: 6,height: 190,),
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

                        /*SizedBox(

                      height: 400,
                      width: 100,
                      child: Image.asset(
                        'lib/images/prescription.png',),
                      //color: Colors.blue,
                    ),*/
                        //const SizedBox(height: 35,width: 10,),

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
                                decoration:  InputDecoration(labelText: 'Patient Name'),
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                              const TextField(
                                decoration:  InputDecoration(labelText: 'Age'),
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                ),
                              ),
                              const TextField(
                                decoration:  InputDecoration(labelText: 'Address'),
                                maxLines: null,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                ),
                              ),
                              const TextField(
                                decoration:  InputDecoration(labelText: 'Medication Name'),
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                ),
                              ),
                              const TextField(
                                decoration: InputDecoration(labelText: 'Dosage'),
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                ),
                              ),
                              const TextField(
                                decoration:  InputDecoration(labelText: 'Instructions'),
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(height: 330,),

                              const Text(
                                '<<Display Pharmacy Address>>',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                ),
                              ),

                              const SizedBox(height: 17),


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
                                            'Save and send',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11)

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

                   Container(

                child: Row(children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.limeAccent,
                  ),

                  const Column(
                    children: [
                      Text('Welcome to '),
                      Text('MedVault')
                    ],
                  ),

                ],),
              ),
                  //doctor list

                ],
              ),


    )
    )
  ]
    )
    );

  }
}



