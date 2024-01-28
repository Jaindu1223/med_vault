
import 'package:flutter/material.dart';
import 'package:med_vault/pages/medical_record.dart';
import 'package:med_vault/pages/my_qr.dart';
import 'package:med_vault/pages/pharmacy_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}):super(key:key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
          child:Column(
            children: [
              //app bar
              /*Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.10,vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //name
                    Container(
                      color: Colors.lightBlueAccent,
                      height: 200,
                      width: 340,
                      alignment: Alignment.bottomLeft,

                      child: const Column(

                        children: [

                          Text(
                              'Welcome to ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          ),
                          Text(
                            'MedVault',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          *//*Text(
                            'Monday 23rd, July, 2060 3:21:59pm',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),*//*
                        ],

                      ),


                      ),
                    //profile photo

                  ],
                ),
              ),*/


          //card how you feel

              Container(

                decoration: BoxDecoration(
                  color: Colors.lightBlue
                ),
                padding: const EdgeInsets.only(left: 20,top: 30, right: 3, bottom: 7),
                child: Row(children: [

                  const SizedBox(width: 6,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        'Welcome to ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        'MedVault',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 29,
                        ),

                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset(
                            'lib/images/Group 2085662530.png'),

                        //color: Colors.limeAccent,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Monday 23rd, July, 2060',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Monday 23rd, July, 2060 3:21:59pm',
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
              const SizedBox(height: 45),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration:  BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(9)),
                  child: Row(children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        'lib/images/pharmacy.png',),
                      //color: Colors.limeAccent,
                    ),
                    const SizedBox(width: 10,),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pharmacy Finder ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black87
                            ),
                          ),
                          const Text(
                            'Find the nearest pharmacy',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 11,

                            ),
                          ),
                          const SizedBox(height: 17),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const PharmacyLocator()));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),

                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: const Center(
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    color: Colors.white,
                                      fontSize: 11)

                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),


                  ],),
                ),

              ),
              const SizedBox(height: 25),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Container(

                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(9)),
                  child: Row(children: [
                    SizedBox(

                      height: 100,
                      width: 100,
                      child: Image.asset(
                        'lib/images/prescription.png',),
                      //color: Colors.blue,
                    ),
                    const SizedBox(height: 35,width: 10,),

                    Expanded(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Text(
                            'Medical Record',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black87
                            ),
                          ),
                          const Text(
                            'Stores your previous reports, ',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 11,
                            ),
                          ),
                          const Text(
                            'Prescriptions',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 17),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const MedicalRecord()));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),

                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: const Center(
                                child: Text(
                                    'View Record Book',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11)

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration:BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(9)),
                  child: Row(children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        'lib/images/qr.png',),
                      //color: Colors.green,
                    ),
                    const SizedBox(height: 35,width: 10,),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'My QR ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black87
                            ),
                          ),
                          const Text(
                            'Personal QR',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 17),
                          
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyQR()));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                            
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: const Center(
                                child: Text(
                                    'View QR Code',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11)
                            
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
          //doctor list

            ],
          ),


      )
    );
  }
}



/*
class MedVaultHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MedVault'),
      ),
      body: Center(
        child: Card(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('path/to/image.png'),
                SizedBox(height: 16),
                Text(
                  'Welcome to MedVault',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Monday 23rd, July, 2060 3:21:59pm',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
