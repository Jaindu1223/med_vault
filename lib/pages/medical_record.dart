import 'package:flutter/material.dart';

class MedicalRecord extends StatefulWidget {
  const MedicalRecord({super.key});

  @override
  State<MedicalRecord> createState() => _MedicalRecordState();
}

class _MedicalRecordState extends State<MedicalRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.blue[100],
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/6 Pharmacy locater-2.png'),
            fit: BoxFit.cover,
            //height: double.infinity,
            //width: double.infinity,
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
                  width: 86,
                ),
                SizedBox(
                  height: 140,
                  width: 100,
                  child: Image.asset(
                    'lib/images/image 9326.png',
                  ),

                  //color: Colors.limeAccent,
                ),
              ],
            ),
          ),

          //search bar

          //categories(horizontal list)
          const SizedBox(height: 25),
          Container(
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.limeAccent,
                ),
                const Column(
                  children: [Text('Welcome to '), Text('MedVault')],
                )
              ],
            ),
          ),
          const SizedBox(height: 25),

          Container(
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.limeAccent,
                ),
                const Column(
                  children: [Text('Welcome to '), Text('MedVault')],
                ),
              ],
            ),
          ),
          //doctor list
        ],
      ),
    ]));
  }
}
