import 'package:flutter/material.dart';
import 'package:med_vault/pages/patient/check.dart';
import 'package:med_vault/pages/patient/home_page.dart';
import 'package:med_vault/pages/patient/navigation_components.dart';
import 'package:med_vault/pages/patient/patient_profile.dart';
import 'package:med_vault/pages/patient/settings.dart';
import 'package:med_vault/pages/patient/view_prescription.dart';
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
  int _selectedIndex = 0;
  int _currentIndex = 2;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  //
  //   switch (index) {
  //     case 0:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => HomePage(email: widget.email)),
  //       );
  //       break;
  //     case 1:
  //       Navigator.push(
  //        context,
  //         MaterialPageRoute(builder: (context) => PharmacySearchPage1(email: widget.email)),
  //      );
  //       break;
  //     case 2:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => MyQR(email: widget.email)),
  //       );
  //       break;
  //     case 3:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => PatientProfile()),
  //       );
  //       break;
  //   }
  // }

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

    Color customBackgroundColor = Color(int.parse('0xFFE3E4E4'));
    return Scaffold(
      backgroundColor: customBackgroundColor,
        //backgroundColor: Colors.grey,
        body: Stack(
          children: [
            Container(
              //padding: const EdgeInsets.only(left: 20,top: 30, right: 3, bottom: 30),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'lib/images/Rectangle 42126.png'),
                  alignment: Alignment.topCenter,

                  fit: BoxFit.fitWidth,
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
        ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Handle navigation based on the index
          switch (index) {
            case 0:
              NavigationService.navigateTo(HomePage(email: widget.email), context);
              break;
            case 1:
              NavigationService.navigateTo(PharmacySearchPage1(email: widget.email), context);
              break;
            case 2:
              NavigationService.navigateTo(MyQR(email: widget.email), context);
              break;
            case 3:
              NavigationService.navigateTo(SettingsPage(email: widget.email), context);
              break;
          }
        },
      ),

    //   bottomNavigationBar: BottomNavigationBar(
    //   //backgroundColor: Colors.lightBlue, // Set background color here
    //   unselectedItemColor: Colors.black, // Set icon color here
    //   items: const <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.home),
    //       label: 'Home Page',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.search_outlined),
    //       label: 'Pharmacy Finder',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.qr_code),
    //       label: 'My QR',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.settings),
    //       label: 'Settings',
    //     ),
    //   ],
    //   currentIndex: _selectedIndex,
    //   selectedItemColor: Colors.blueAccent,
    //   onTap: _onItemTapped,
    // ),


    );
  }
}
