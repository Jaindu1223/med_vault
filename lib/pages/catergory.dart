
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:med_vault/pages/doctor/home_pageD.dart';
import 'package:med_vault/pages/doctor/new_prescription.dart';
import 'package:med_vault/pages/doctor/patient_history.dart';
import 'package:med_vault/pages/doctor/signin_doc.dart';

import 'package:med_vault/pages/doctor/signup_doc.dart';
import 'package:med_vault/pages/patient/medical_record.dart';
import 'package:med_vault/pages/patient/sign_in.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  String? _userType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[100],
      body: Stack(
        children:[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/images/splash.png'),
                fit: BoxFit.cover,
                //height: double.infinity,
                //width: double.infinity,
              ),
            ),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 0,top: 420, right: 0, bottom:0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const Text(
                    'Tailor Your Experience',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 48,),
                  const Text(
                    'To provide you with a good \n experience, please select your \n role below:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.indigo, // You can use the 'indigo' color for dark blue
                    ),
                  ),


                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0,),


                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100,top: 0, right: 0, bottom:0),
                    child: RadioListTile<String>(
                      value: 'Doctor',
                      groupValue: _userType,
                      onChanged: (value){
                        setState(() {
                          _userType= value as String;
                        });
                        if(_userType=='Doctor'){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> SignInDoc()),
                          );
                        }//if
                      },
                      title: const Text('Doctor'),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 100,top: 0, right: 0, bottom:0),
                    child: RadioListTile<String>(
                      value: 'Patient',
                      groupValue: _userType,
                      onChanged: (value){
                        setState(() {
                          _userType= value as String;
                        });
                        if(_userType=='Patient'){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> SignIn()),
                          );
                        }//if
                      },
                      title: const Text('Patient'),
                    ),
                  )
                ],
              ),
            ),
          )


        ],
      ),


      // ])
    );
  }
}





