import 'package:flutter/material.dart';
import 'package:med_vault/pages/doctor/new_prescription.dart';
import 'package:med_vault/pages/patient/sign_in.dart';
import 'package:med_vault/pages/patient/medical_record.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: const EdgeInsets.only(left: 20, top: 30, right: 3, bottom: 7),
                child: Row(
                  children: [
                    const SizedBox(width: 6, height: 190,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Patient Profile',
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
                      ],
                    ),
                    const SizedBox(width: 86,),
                    SizedBox(
                      height: 140,
                      width: 100,
                      child: Image.asset('lib/images/doctor.png'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(9)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [

                          const SizedBox(width: 15),
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('lib/images/profile_image.png'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn()));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              width: 170,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  'LogOut',
                                  style: TextStyle(color: Colors.white, fontSize: 11),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ],
      ),
    );
  }
}

