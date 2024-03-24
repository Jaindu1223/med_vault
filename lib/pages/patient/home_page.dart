
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
  
  const HomePage({Key? key, required this.email}):super(key:key);

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
        NavigationService.navigateTo(PharmacySearchPage1(), context);
        break;
      case 2:
        NavigationService.navigateTo(MyQR(email: widget.email), context);
        break;
      case 3:
        NavigationService.navigateTo(SettingsPage(), context);
        break;
    }
    //
    // switch (index) {
    //   case 0:
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => HomePage(email:widget.email)),
    //     );
    //     break;
    //   case 1:
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => PharmacySearchPage1()),
    //     );
    //     break;
    //   case 2:
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => MyQR(email: widget.email)),
    //     );
    //     break;
    //   case 3:
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => SettingsPage()),
    //     );
    //     break;
    // }
  }


  @override
  Widget build(BuildContext context) {
    // Get current date and time
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE d MMMM, y')
        .format(now); // Format: Monday 23 July, 2022
    String formattedTime = DateFormat.jm().format(now); // Format: 3:21:59 PM


    return Scaffold(
      //backgroundColor: Colors.blue,
      body: Stack(
        children:[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/images/6 Pharmacy locater-2.png'),
                fit: BoxFit.cover,
            ),
            ),

          ),

        Column(

          children: [

            Container(
              padding: const EdgeInsets.only(left: 20,top: 30, right: 3, bottom: 7),
              child: Row(children: [

                const SizedBox(width:1,height: 180,),
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
                      child: Image.asset(
                          'lib/images/Group 2085662530.png'),
                    ),
                    const SizedBox(height: 1),

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
                    const SizedBox(height: 2),

                  ],
                ),

                //Text('User Name, ${widget.email}'),

                const SizedBox(width: 86,),



                SizedBox(
                  height: 140,
                  width: 100,
                  child: Image.asset(
                      'lib/images/image 9326.png',),
                ),
              ],),
            ),

            //Text('User Name, ${widget.email}'),

            Padding(
              padding: const EdgeInsets.only(left: 0,top: 0,right: 30,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Container(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const PatientProfile()));
                      },
                      child: const Icon(Icons.person,)),
                  )],
              ),
            ),

            const SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration:  BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.circular(9)),
                child: Row(children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'lib/images/pharmacy.png',),
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
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 17),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> PharmacySearchPage1()));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
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
                ],
                ),
              ),
            ),
            const SizedBox(height: 25),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(9)),
                child: Row(children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'lib/images/prescription.png',),
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
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder:
                                    (context)=>viewPrescription(email: widget.email)));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: const Center(
                              child: Text(
                                  'View Prescription',
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
                decoration:BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(9)),
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
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 17),

                        InkWell(
                          onTap: (){
                            Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                         builder: (context) => MyQR(email: widget.email),
                                        ),
                                      );;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
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
          ],
        ),
    ]),


      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.lightBlue, // Set background color here
        unselectedItemColor: Colors.black, // Set icon color here
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Pharmacy Finder',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'My QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),



    );
  }
}

