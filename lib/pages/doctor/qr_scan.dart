/*

import 'package:flutter/material.dart';
import 'package:med_vault/pages/doctor/new_prescription.dart';
import 'package:med_vault/pages/doctor/patient_history.dart';
import 'package:med_vault/pages/patient/medical_record.dart';

class QrScan extends StatefulWidget {
  const QrScan({super.key});

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {

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

              Column(
                children: [

                  Container(
                    padding: const EdgeInsets.only(left: 20,top: 30, right: 3, bottom: 7),
                    child: Row(children: [

                      const SizedBox(width: 6,height: 190,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          const Text(
                            'Digital ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Prescription',
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
                          'lib/images/qr.png',),

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

                        //const SizedBox(height: 35,width: 10,),

                        Expanded(
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Text(
                                'Scanning....',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black87
                                ),
                              ),
                              const Text(
                                '<<Display Qr>> ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(height: 330,),

                              const SizedBox(height: 17),

                              Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: Center(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const PatientHistory()));
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
                              const SizedBox(height: 5),

                              Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: Center(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const NewPrescription()));
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
                                            'New Prescription',
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


                  //doctor list

                ],
              ),


            ])
    );
  }
}

*/


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrScan extends StatefulWidget {
  const QrScan({super.key});

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  String result ="";

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData){
      setState(() {
        result = scanData.code!;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

        title: Text("QR code scanner"),
      ),

      body:Column(
        children: [
          Expanded(
            flex: 1,
            child:QRView(
              key: qrKey,
              onQRViewCreated:_onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 0,
            child: Center(
              child: Text(
                "Scan Result: $result",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if(result.isNotEmpty){
                      Clipboard.setData(ClipboardData(text: result));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:Text("copied to the Clipboard"),
                        ),
                      );
                    }
                  },
                  child: Text("View History"),
                ),
                ElevatedButton(
                  onPressed: ()async {
                    if(result.isNotEmpty){
                      final Uri _url= Uri.parse(result);
                      await launchUrl(_url);
                    }
                  },
                  child: Text("Create a new prescription"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

