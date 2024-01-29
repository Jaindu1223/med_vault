
import 'package:flutter/material.dart';
import 'package:med_vault/pages/doctor/home_pageD.dart';
import 'package:med_vault/pages/patient/medical_record.dart';

class DocPrescription extends StatefulWidget {
  const DocPrescription({super.key});

  @override
  State<DocPrescription> createState() => _DocPrescriptionState();
}

class _DocPrescriptionState extends State<DocPrescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[100],
        body: Stack(
            children:[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'lib/images/6 Pharmacy locater-2.png'),
                    fit: BoxFit.cover,
                    //height: double.infinity,
                    //width: double.infinity,
                  ),
                ),
              ),
              Column(
                children: [

                  Container(

                    /*decoration: BoxDecoration(
                color: Colors.lightBlue
              ),*/
                    padding: const EdgeInsets.only(left: 20,top: 30, right: 3, bottom: 7),
                    child: Row(children: [

                      const SizedBox(width: 6,height: 190,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          const Text(
                            'Welcome to ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'MedVault',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 29,
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
                              fontSize: 13,
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
                      const SizedBox(width: 86,),



                      SizedBox(
                        height: 140,
                        width: 100,
                        child: Image.asset(
                          'lib/images/image 9326.png',),

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
                                'Make Your Own Prescription',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black87
                                ),
                              ),
                              const Text(
                                '<<edit>> ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(height: 330,),
                              /*const Text(
                                '<<Display Pharmacy Address>>',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                ),
                              ),*/
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
                                            'Save',
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

                  /*Container(

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
              ),*/
                  //doctor list

                ],
              ),


            ])
    );
  }
}

