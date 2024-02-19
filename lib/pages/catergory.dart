
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
                    'lib/images/welc.png'),
                fit: BoxFit.cover,
                //height: double.infinity,
                //width: double.infinity,
              ),
            ),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(76.0,600.0,26.0,26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),


                  ),
                  RadioListTile<String>(
                    value: 'Doctor',
                    groupValue: _userType,
                    onChanged: (value){
                      setState(() {
                        _userType= value as String;
                      });
                      if(_userType=='Doctor'){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> HomePageDoc()),
                        );
                      }//if
                    },
                    title: const Text('Doctor'),
                  ),

                  RadioListTile<String>(
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





