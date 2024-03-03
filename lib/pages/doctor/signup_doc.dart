import 'package:flutter/material.dart';
import 'package:med_vault/pages/doctor/signin_doc.dart';
// import 'package:med_vault/pages/patient/sign_in.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';
import 'dart:convert';

class SignUpDoc extends StatefulWidget {
  const SignUpDoc({super.key});

  @override
  State<SignUpDoc> createState() => _SignUpDocState();
}

class _SignUpDocState extends State<SignUpDoc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'lib/images/signup_img.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(
              26.0, 50.0, 26.0, 26.0), // Add the padding here
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30.0),
              const Text('Full name'),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your full name',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  contentPadding:
                      const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email Address'),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter the Email Address',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('SLMC Registration No'),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'SLMC Registration No',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('NIC'),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your NIC',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Password'),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    ),
                    obscureText: true,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Confirm password'),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your confirm password',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 40.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 200),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInDoc()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text('Continue.',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ))
      ],
    ));
  }
}





