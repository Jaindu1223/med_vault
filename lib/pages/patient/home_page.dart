import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_vault/pages/patient/check.dart';
// import 'package:med_vault/pages/patient/medical_record.dart';
import 'package:med_vault/pages/patient/my_qr.dart';
import 'package:med_vault/pages/patient/navigation_components.dart';
import 'package:med_vault/pages/patient/patient_profile.dart';
import 'package:med_vault/pages/patient/pharmacy_spotter.dart';
import 'package:med_vault/pages/patient/settings.dart';
import 'package:med_vault/pages/patient/view_prescription.dart';

class HomePage extends StatefulWidget {
  final String email;

  const HomePage({Key? key, required this.email}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        NavigationService.navigateTo(HomePage(email: widget.email), context);
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

  }

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

      body: Stack(children: [
        Container(
          //padding: const EdgeInsets.only(left: 20,top: 30, right: 3, bottom: 30),
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
                    left: 20, top: 24, right: 3, bottom: 30),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 1,
                      height: 180,
                    ),
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
                        Row(
                          children: [
                            const Text(
                              'MedVault',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 29,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 14),
                            SizedBox(
                              height: 40,
                              width: 30,
                              child: Image.asset(
                                  'lib/images/Group 2085662530.png'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'HI, ${widget.email}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            fontSize: 12,
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
                        const SizedBox(height: 2),
                      ],
                    ),

                    //Text('User Name, ${widget.email}'),

                    const SizedBox(
                      width: 86,
                    ),

                    SizedBox(
                      height: 140,
                      width: 70,
                      child: Image.asset(
                        'lib/images/doctor-2027615_1920.png',
                      ),
                    ),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 0, right: 30, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PatientProfile()));
                          },
                          child: const Icon(
                            Icons.person,
                          )),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 5),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(9)),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 60,
                        child: Image.asset(
                          'lib/images/medicine-2801025_1920.png',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Pharmacy Finder ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black87),
                            ),
                            const Text(
                              'Find the nearest pharmacy',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 17),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PharmacySearchPage1(
                                                email: widget.email)));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text('Get Started',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 35),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(9)),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 65,
                        child: Image.asset(
                          'lib/images/medical-5459661_1920.png',
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Medical Record',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black87),
                            ),
                            const Text(
                              'Stores your previous reports, ',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                              ),
                            ),
                            const Text(
                              'Prescriptions',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 17),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => viewPrescription(
                                            email: widget.email)));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text('View Prescription',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 35),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(9)),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 62,
                        child: Image.asset(
                          'lib/images/qr-code-2816041_1920.png',
                        ),
                        //color: Colors.green,
                      ),
                      const SizedBox(
                        height: 35,
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'My QR ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black87),
                            ),
                            const Text(
                              'Personal QR',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 17),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MyQR(email: widget.email),
                                  ),
                                );
                                ;
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text('View QR Code',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),

      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),

    );
  }
}
