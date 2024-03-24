
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_vault/pages/doctor/new_prescription.dart';
import 'package:med_vault/pages/patient/medical_record.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  String name = "John Doe";
  String address = "123 Main Street";
  String SLMC = "12343";
  String birthday = "123 Main Street";
  int age = 30;
  String phoneNumber = "123-456-7890";
  String email = "johndoe@example.com";

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
                          'Doctor Profile',
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
                    const SizedBox(width: 20,),
                    Expanded(
                      child: SizedBox(
                        height: 85,
                        width: 60,
                        child: Image.asset('lib/images/user-307993_1920.png'),
                      ),
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
                      _buildProfileDetail('Name', name),
                      const SizedBox(height: 25),
                      _buildProfileDetail('SLMC number', SLMC),
                      const SizedBox(height: 25),
                      _buildProfileDetail('birthday', birthday),
                      const SizedBox(height: 25),
                      _buildProfileDetail('Email', email),
                      const SizedBox(height: 25),
                      _buildProfileDetail('Address', address),
                      const SizedBox(height: 25),
                      _buildProfileDetail('Age', age.toString()),
                      const SizedBox(height: 25),
                      _buildProfileDetail('Phone Number', phoneNumber),


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

  Widget _buildProfileDetail(String label, String value) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
