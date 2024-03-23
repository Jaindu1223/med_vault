import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_vault/pages/doctor/customize_prescription.dart';
import 'package:med_vault/pages/doctor/doctor_profile.dart';
import 'package:med_vault/pages/doctor/qr_scan.dart';
import 'package:med_vault/pages/patient/check.dart';
import '../patient/pharmacy_spotter.dart';
// import 'new_prescription.dart';

class HomePageDoc extends StatefulWidget {
  final String docemail;
  const HomePageDoc({Key? key, required this.docemail}) : super(key: key);

  @override
  State<HomePageDoc> createState() => _HomePageDocState();
}

class _HomePageDocState extends State<HomePageDoc> {
  @override
  Widget build(BuildContext context) {
    // Get current date and time
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE d MMMM, y')
        .format(now); // Format: Monday 23 July, 2022
    String formattedTime = DateFormat.jm().format(now); // Format: 3:21:59 PM

    return Scaffold(
      body: Stack(children: [
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
              padding:
                  const EdgeInsets.only(left: 20, top: 30, right: 3, bottom: 7),
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
                          fontSize: 29,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 20,
                        child: Image.asset('lib/images/Group 2085662530.png'),
                      ),
                      const SizedBox(height: 1),
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
                    width: 86,
                  ),
                  SizedBox(
                    height: 140,
                    width: 100,
                    child: Image.asset(
                      'lib/images/doctor.png',
                    ),
                  ),
                ],
              ),
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
                      width: 90,
                      child: Image.asset(
                        'lib/images/qr.png',
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                      width: 10,
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
                                      builder: (context) =>  QrScan(email: widget.docemail, )));
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
            const SizedBox(height: 25),
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
                      width: 90,
                      child: Image.asset(
                        'lib/images/pharmacy.png',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
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
                                          PharmacySearchPage1()));
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
            const SizedBox(height: 25),
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
                      width: 90,
                      child: Image.asset(
                        'lib/images/prescription.png',
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                      width: 10,
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
      ]),
    );
  }
}
