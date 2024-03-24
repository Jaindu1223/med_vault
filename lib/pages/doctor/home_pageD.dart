import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:med_vault/pages/doctor/customize_prescription.dart';
import 'package:med_vault/pages/doctor/doc_pharmacy_spotter.dart';
import 'package:med_vault/pages/doctor/doctor_profile.dart';
import 'package:med_vault/pages/doctor/navigation_components_doc.dart';
import 'package:med_vault/pages/doctor/qr_scan.dart';
import 'package:med_vault/pages/patient/check.dart';
import 'package:med_vault/pages/patient/navigation_components.dart';
import 'package:med_vault/pages/patient/settings.dart';
import '../patient/pharmacy_spotter.dart';
import 'doc_settings.dart';
// import 'new_prescription.dart';

class HomePageDoc extends StatefulWidget {
  final String email;
  final String docemail;
  const HomePageDoc({Key? key, required this.email,required this.docemail}) : super(key: key);

  @override
  State<HomePageDoc> createState() => _HomePageDocState();
}

class _HomePageDocState extends State<HomePageDoc> {
  int _selectedIndexD = 0;

  void _onItemTapped(int indexD) {
    setState(() {
      _selectedIndexD = indexD;
    });

    switch (indexD) {
      case 0:
        NavigationServiceDoc.navigateTo(
            HomePageDoc(email: widget.email, docemail: widget.docemail),
            context);
        break;
      case 1:
        NavigationServiceDoc.navigateTo(
            PharmacySearchPage2(email: widget.email, docemail: widget.docemail,), context);
        break;
      case 2:
        NavigationServiceDoc.navigateTo(
            QrScan(email: widget.email,docemail: widget.docemail), context);
        break;
      case 3:
        NavigationServiceDoc.navigateTo(
            docSettingsPage(email: widget.email, docemail: widget.docemail,), context);
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
      body: Stack(children: [
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
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.only(left: 20, top: 20, right: 3, bottom: 6),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 1,
                      height: 190,
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
                        const Text(
                          'MedVault',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 20,
                          child: Image.asset('lib/images/Group 2085662530.png'),
                        ),
                        const SizedBox(height: 0),
                        Text(
                          'HI, ${widget.docemail}',
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
                      ],
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 140,
                        width: 100,
                        child: Image.asset(
                          'lib/images/doctor-2027615_1920.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 0, top: 0, right: 30, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DoctorProfile()));
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
                        width: 55,
                        child: Image.asset(
                          'lib/images/qr-code-2816041_1920.png',
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
                              'Digital Prescription ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black87),
                            ),
                            const Text(
                              'Scan QR and provide digital prescription',
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
                                        builder: (context) =>  QrScan(email: widget.email,docemail: widget.docemail)));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text('Scan QR & Provide',
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
              const SizedBox(height: 40),
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
                        width: 61,
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
                                            PharmacySearchPage2(email: "",docemail: "",)));
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
              const SizedBox(height: 40),
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
                        width: 58,
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
                              'Customize Prescription',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black87),
                            ),
                            const Text(
                              'You can customize prescription ',
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
                                            const DocPrescription()));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text('Edit Prescription',
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

      bottomNavigationBar: CustomBottomNavigationBar2(
        currentIndexD: _selectedIndexD,
        onTap: _onItemTapped,
      ),

      // bottomNavigationBar: BottomNavigationBar(
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
