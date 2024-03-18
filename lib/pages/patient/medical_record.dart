
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_vault/pages/patient/home_page.dart';
import 'package:med_vault/pages/patient/medical_record.dart';

class MedicalRecords extends StatefulWidget {
  const MedicalRecords({super.key});

  @override
  State<MedicalRecords> createState() => _MedicalRecordsState();
}

class _MedicalRecordsState extends State<MedicalRecords> {
  @override
  Widget build(BuildContext context) {
    // Get current date and time
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE d MMMM, y')
        .format(now); // Format: Monday 23 July, 2022
    String formattedTime = DateFormat.jm().format(now); // Format: 3:21:59 PM
    return Scaffold(
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
                            'Medical Record ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'View your history',
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
                              fontSize: 13,
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
                          'lib/images/medicine.png',),

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
                                'My History',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black87
                                ),
                              ),
                              const Text(
                                '<<Display previous prescription>> ',
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

                              Padding(
                                padding: const EdgeInsets.only(left: 150),
                                child: Center(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage(email: '',)));
                                    },

                                    child: Container(

                                      //padding: const EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
                                      padding: const EdgeInsets.all(4),
                                      width: 150,


                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                        child: Text(
                                            'Continue With Maps',
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

