import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_vault/pages/patient/check.dart';
import 'package:med_vault/pages/patient/home_page.dart';
import 'package:med_vault/pages/patient/navigation_components.dart';
import 'package:med_vault/pages/patient/settings.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

class MyQR extends StatefulWidget {
  final String email;
  const MyQR({Key? key, required this.email}) : super(key: key);

  @override
  State<MyQR> createState() => _MyQRState();
}

class _MyQRState extends State<MyQR> {
  int _currentIndex = 2;
  final TextEditingController _textController = TextEditingController(text: '');
  String data = '';
  final GlobalKey _qrkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE d MMMM, y')
        .format(now); // Format: Monday 23 July, 2022
    String formattedTime = DateFormat.jm().format(now); // Format: 3:21:59 PM
    Color customBackgroundColor = Color(int.parse('0xFFE3E4E4'));

    return Scaffold(
      backgroundColor: customBackgroundColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/Rectangle 42126.png'),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, top: 20, right: 3, bottom: 7),
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
                              fontSize: 27,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            width: 20,
                            child:
                                Image.asset('lib/images/Group 2085662530.png'),
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
                        width: 90,
                        child: Image.asset(
                          'lib/images/qr-code-156717_1920.png',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 75),
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
              NavigationService.navigateTo(
                  HomePage(email: widget.email), context);
              break;
            case 1:
              NavigationService.navigateTo(
                  PharmacySearchPage1(email: widget.email), context);
              break;
            case 2:
              NavigationService.navigateTo(MyQR(email: widget.email), context);
              break;
            case 3:
              NavigationService.navigateTo(
                  SettingsPage(email: widget.email), context);
              break;
          }
        },
      ),
    );
  }
}
