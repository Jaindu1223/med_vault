import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'package:http/http.dart' as http;
import 'dart:ui';
import 'package:intl/intl.dart';

class MyQR extends StatefulWidget {
  final String email;

  const MyQR({Key? key, required this.email}) : super(key: key);

  @override
  State<MyQR> createState() => _MyQRState();
}

class _MyQRState extends State<MyQR> {
  // String? userEmail; // Store user's email fetched from the backend  *****
  final TextEditingController _textController = TextEditingController(text: '');

  String data = '';
  final GlobalKey _qrkey = GlobalKey();

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
    // Get current date and time
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE d MMMM, y')
        .format(now); // Format: Monday 23 July, 2022
    String formattedTime = DateFormat.jm().format(now); // Format: 3:21:59 PM

    return Scaffold(
        backgroundColor: Colors.white70,
        body: SingleChildScrollView(
          child: Stack(
            children: [
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
                    padding: const EdgeInsets.only(
                        left: 20, top: 30, right: 3, bottom: 7),
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
                                color: Colors.black,
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
                              child: Image.asset(
                                  'lib/images/Group 2085662530.png'),

                              //color: Colors.limeAccent,
                            ),
                            const SizedBox(height: 1),
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              formattedTime,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
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
                        ),
                      ],
                    ),
                  ),

                  //search bar

                  //categories(horizontal list)

                  const SizedBox(height: 25),

                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      // controller: TextEditingController(text: widget.email),
                      controller: _textController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        labelText: 'Enter Text',
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 146, 20),
                              width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        data = _textController.text;
                      });
                    },
                    fillColor: Colors.cyan,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 36, vertical: 16),
                    child: const Text(
                      'View My QR',

                      // 'Generate',

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

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
                  )),
                ],
              ),
            ],
          ),
        ));
  }
}
