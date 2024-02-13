import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:med_vault/pages/doctor/home_pageD.dart';
import 'package:med_vault/pages/doctor/signup_doc.dart';
import 'package:med_vault/pages/patient/fog_pw.dart';

import 'package:med_vault/pages/patient/home_page.dart';
import 'package:med_vault/pages/patient/sign_up.dart';

import '../catergory.dart';
//import 'package:med_vault/pages/doctor/fog_pw.dart';

class homepage1 extends StatefulWidget {
  const homepage1({super.key});

  @override
  State<homepage1> createState() => _homepage1State();
}

class _homepage1State extends State<homepage1> {

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SignInDoc();
          }
          return const Center(
              child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}


class SignInDoc extends StatefulWidget {
  const SignInDoc({super.key});

  @override
  _SignInDocState  createState() => _SignInDocState();
}

class _SignInDocState extends State<SignInDoc> {



  static Future<User?> loggingUsingEmailPassword(
      {required String email, required String password, required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email.");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
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
                        padding: const EdgeInsets.only(top: 80.0),
                        // Add padding at the top
                        child: Center(
                          child: Image.asset(
                            'lib/images/welcome.png',
                            height: 300,
                            width: 300,
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        // Add padding here
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'bla@gmail.com',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            contentPadding: const EdgeInsets.fromLTRB(
                                16.0, 10.0, 16.0, 10.0),
                          ),
                        ),
                      ),

                      const SizedBox(height: 26),

                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          contentPadding: const EdgeInsets.fromLTRB(
                              16.0, 10.0, 16.0, 10.0),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  ForgotPasswordPage()),
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 56),
                      Container(
                        width: double.infinity,
                        child: RawMaterialButton(
                          fillColor: const Color(0xFF0069FE),
                          elevation: 0.0,
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),),
                          onPressed: () async {
                            User? user = await loggingUsingEmailPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                                context: context);
                            print(user);
                            if (user != null) {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>HomePageDoc()));

                            }
                          },
                          child: const Text('Sign in',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              )),
                        ),
                      ),
                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account ?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => const SignUpDoc()));
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blue,
                            ),
                            child: const Text('Sign Up'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                            text: 'By signing in, you agree to our ',
                            children: [
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
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
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                    ], //children
                  ),
                ),
              ),
            ]
        )

    );
  }
}
