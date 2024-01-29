import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:med_vault/pages/doctor/home_pageD.dart';

import 'package:med_vault/pages/patient/home_page.dart';
import 'package:med_vault/pages/patient/sign_up.dart';
import 'fog_pw.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
            children: [
              Image.asset(
                'lib/images/bg_2.png',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),

              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80.0), // Add padding at the top
                        child: Center(
                          child: Image.asset(
                            'lib/images/welcome.png',
                            height: 300,
                            width: 300,
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 10.0), // Add padding here
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'bla@gmail.com',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                          ),
                        ),
                      ),

                      SizedBox(height: 26),

                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          contentPadding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                        ),
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 56),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              fixedSize: Size(260, 28),
                              foregroundColor: Colors.white,
                              textStyle: TextStyle(
                                fontSize: 18,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          ),
                          child: Text('Sign in'),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account ?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blue,
                            ),
                            child: Text('Sign Up'),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                            text: 'By signing in, you agree to our ',
                            children: [
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap=(){
                                    //the link to the page
                                  },
                              ),

                              // TextSpan(
                              //   text: ' and ',
                              // ),
                              //
                              // TextSpan(
                              //   text: 'Privacy Statement',
                              //   style: TextStyle(
                              //     decoration: TextDecoration.underline,
                              //   ),
                              //   recognizer: TapGestureRecognizer()
                              //     ..onTap=(){
                              //       //the link to the page
                              //     },
                              // ),
                            ]
                        ),
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                    ],//children
                  ),
                ),
              ),
            ]
        )

    );
  }
}
