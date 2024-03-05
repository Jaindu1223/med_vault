import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:med_vault/pages/patient/home_page.dart';
import 'package:med_vault/pages/patient/sign_up.dart';
import 'fog_pw.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isNotValidate = false;


  void loginUser() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {

      setState(() {
        _isNotValidate = false;
      });

      var regBody = {
        "email": _emailController.text,
        "password": _passwordController.text
      };

      var response = await http.post(
        Uri.parse('http://10.0.2.2:4000/userLogin'),
        body: json.encode(regBody),
        headers: {'Content-Type': 'application/json'},
      );
      var jsonResponse = jsonDecode(response.body);
      // print(jsonResponse['status']);
      if (jsonResponse['status']) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        print("SomeThing Went Wrong");
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

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
                        padding: const EdgeInsets.only(top: 60.0), // Add padding at the top
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
                        child:
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'bla@gmail.com',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),),
                            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            contentPadding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                            errorText: _isNotValidate ? "Email is required" : null,
                            // errorText: _emailController.text.isEmpty ? 'Email is required' : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // TextField(
                      //   controller: _passwordController,
                      //   // obscureText: true,
                      //   decoration: InputDecoration(
                      //     hintText: 'NIC',
                      //     hintStyle: TextStyle(color: Colors.grey[500]),
                      //     enabledBorder: const OutlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.grey),
                      //     ),
                      //     focusedBorder: const OutlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.blue),
                      //     ),
                      //     fillColor: Colors.grey.shade100,
                      //     filled: true,
                      //     contentPadding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                      //   ),
                      // ),
                      // const SizedBox(height: 16),

                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          contentPadding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                          errorText: _passwordController.text.isEmpty && _isNotValidate ? "Password is required" : null,
                          errorStyle: const TextStyle(color: Colors.black),
                          // errorText: _passwordController.text.isEmpty ? 'Password is required' : null,
                        ),
                      ),
                      const SizedBox(height: 16),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
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
                      const SizedBox(height: 50),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            loginUser();
                            if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                              // Show error message or toast here
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Email and Password are required')),
                              );
                            } else {
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              fixedSize: const Size(260, 28),
                              foregroundColor: Colors.white,
                              textStyle: const TextStyle(
                                fontSize: 18,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          ),
                          child: const Text('Sign in'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account ?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
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
                                  ..onTap=(){

                                  },
                              ),
                            ]
                        ),
                        style: const TextStyle(
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
