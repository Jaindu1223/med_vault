import 'package:flutter/material.dart';
// import 'package:med_vault/pages/patient/medical_record.dart';
import 'package:qr_flutter/qr_flutter.dart';
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

  @override
  Widget build(BuildContext context) {
    // Get current date and time
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE d MMMM, y')
        .format(now); // Format: Monday 23 July, 2022
    String formattedTime = DateFormat.jm().format(now); // Format: 3:21:59 PM

    return Scaffold(
        //backgroundColor: Colors.grey,
        body: Stack(
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
                              color: Colors.white,
                            ),
                          ),

                          SizedBox(
                            height: 60,
                            width: 20,
                            child: Image.asset(
                                'lib/images/Group 2085662530.png'),

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

                const SizedBox(height: 25),

                const Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  // child: TextField(
                  //   controller: _textController,
                  //   decoration: const InputDecoration(
                  //     contentPadding: EdgeInsets.all(10),
                  //     labelText: 'Enter Text',
                  //     labelStyle: TextStyle(color: Colors.white),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //           color: Color.fromARGB(255, 0, 146, 20), width: 2.0),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  //     ),
                  //   ),
                  // ),
                ),

                const SizedBox(
                  height: 15,
                ),

                // RawMaterialButton(
                //
                //
                //   onPressed: () {
                //     setState(() {
                //       // _textController.text = widget.email;
                //       data = widget.email;
                //     });
                //   },
                //
                //   fillColor: Colors.cyan,
                //   shape: const StadiumBorder(),
                //   padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                //   child: const Text(
                //
                //     'generate',
                //
                //     // 'Generate',
                //
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 18,
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 25,),

                Center(
                    child: RepaintBoundary(
                  key: _qrkey,
                  child: QrImageView(
                    data: widget.email,
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
        ));
  }
}
