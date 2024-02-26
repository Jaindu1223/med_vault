import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:med_vault/pages/patient/medical_record.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQR extends StatefulWidget {
  const MyQR({super.key});

  @override
  State<MyQR> createState() => _MyQRState();
}

class _MyQRState extends State<MyQR> {

  String? userEmail; // Store user's email fetched from the backend
  final TextEditingController _textController = TextEditingController(text: '');
  String data = '';
  GlobalKey _qrkey = GlobalKey();

  // Function to fetch user's email from backend
  // Future<void> fetchUserEmail() async {
  //
  //   final response = await http.get(
  //       //Uri.parse('https://your-backend-api/user/${userId}/email')); // Replace with your actual backend endpoint
  //     Uri.parse('http://localhost:3000/users'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'email': _medicineController.text,
  //     }),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       userEmail = response.body['email'];
  //     });
  //   } else {
  //     print('Failed to fetch user email: ${response.reasonPhrase}');
  //   }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   fetchUserEmail(); // Fetch user's email when the widget is initialized
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,

      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/6 Pharmacy locater-2.png'),
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
                padding:
                const EdgeInsets.only(left: 20, top: 30, right: 3, bottom: 7),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 6,
                      height: 190,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'My QR',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 29,
                            color: Colors.white,
                          ),
                        ),
                        /*const Text(
                        'MedVault',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 29,
                          color: Colors.white,
                        ),
                      ),*/
                        SizedBox(
                          height: 60,
                          width: 20,
                          child: Image.asset('lib/images/Group 2085662530.png'),
        
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
                    const SizedBox(
                      width: 100,
                    ),
                    SizedBox(
                      height: 120,
                      width: 70,
                      child: Image.asset(
                        'lib/images/qr-code-blue.png',
                      ),
        
                      //color: Colors.limeAccent,
                    ),
                  ],
                ),
              ),
        
        
              //search bar
        
              //categories(horizontal list)
        
              const SizedBox(height: 25),
        
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Enter Text',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 146, 20), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  ),
                ),
              ),
        
              const SizedBox(height: 15,),
        
              RawMaterialButton(
                onPressed: () {
                  setState(() {
                    data = _textController.text;
                  });
                },
                fillColor: Colors.cyan,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                child: const Text(
                  'Generate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 25,),

              Center(
                child: RepaintBoundary(
                  key: _qrkey,
                  child: QrImageView(
                    data: data,
                    version: QrVersions.auto,
                    size: 250.0,
                    gapless: true,
                    errorStateBuilder: (ctx, err) {
                      return const Center(
                        child: Text(
                          'Something went wrong!',
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                )


              ),

            ],
          ),
        ],),
      )
    );
  }
}


            /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(9)),
                child: Row(
                  children: [
                    *//*SizedBox(

                      height: 400,
                      width: 100,
                      child: Image.asset(
                        'lib/images/prescription.png',),
                      //color: Colors.blue,
                    ),*//*
                    //const SizedBox(height: 35,width: 10,),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'MY QR',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black87),
                          ),
                          const Text(
                            '<<Display QR>> ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(
                            height: 330,
                          ),
                          const Text(
                            '<<Test >>',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 17),
                          Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const MedicalRecords()));
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
                                    child: Text('View Details',
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
                  ],
                ),
              ),
            ),*/

