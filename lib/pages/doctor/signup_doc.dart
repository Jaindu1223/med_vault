import 'package:flutter/material.dart';
import 'package:med_vault/pages/doctor/signin_doc.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpDoc extends StatefulWidget {
  const SignUpDoc({super.key});

  @override
  State<SignUpDoc> createState() => _SignUpDocState();
}

class _SignUpDocState extends State<SignUpDoc> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  // late String fullName, email, SLMCregiNo, nic, password, confirmPassword;
  //
  // final _nameController = TextEditingController();
  // final _emailController = TextEditingController();
  // final _SLMCregiNoControllerr = TextEditingController();
  // final _nicController = TextEditingController();
  // final _passwordController = TextEditingController();
  // final _confirmPasswordController = TextEditingController();
  // bool _isNotValidate = false;
  //
  // Future<bool> registerUser() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //
  //     setState(() {
  //       _isNotValidate = false;
  //     });
  //
  //     var regBody = {
  //       "name": _nameController.text,
  //       "email": _emailController.text,
  //       "SLMCregiNo": _SLMCregiNoControllerr.text,
  //       "NIC": _nicController.text,
  //       "password": _passwordController.text
  //     };
  //     try {
  //       var response = await http.post(
  //         Uri.parse('http://10.0.2.2:4000/doctorRegistration'),
  //         body: json.encode(regBody),
  //         headers: {'Content-Type': 'application/json'},
  //       );
  //
  //       if (response.statusCode == 200) {
  //         // Registration successful
  //         var jsonResponse = jsonDecode(response.body);
  //         if (jsonResponse['status']) {
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             const SnackBar(content: Text('Registration successful')),
  //           );
  //           return true;
  //         } else {
  //           // Registration failed
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(
  //                 content:
  //                     Text('Registration failed: ${jsonResponse['message']}')),
  //           );
  //         }
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //               content: Text(
  //                   'Error ${response.statusCode}: ${response.reasonPhrase}')),
  //         );
  //       }
  //     } catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Error: $e')),
  //       );
  //     }
  //   } else {
  //     setState(() {
  //       _isNotValidate = true;
  //     });
  //   }
  //   return false;
  // }

  late String name;
  late String email;
  late int NIC;
  late String password;
  late int SLMCregiNo;

  Widget _buildNameField() {
    return TextFormField(
      validator: (text) {
        return HelperValidator.nameValidate(text!);
      },
      decoration:
      InputDecoration(
        hintText: 'Enter your full name',
        hintStyle: TextStyle(color: Colors.grey[500]),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        fillColor: Colors.grey.shade100,
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      ),
      onSaved: (value) {
        name = value!;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      validator: (text) {
        if (text!.isEmpty) {
          return "Please enter a valid email";
        }
        return null;
      },
      decoration:InputDecoration(
      hintText: 'Enter the Email Address',
    hintStyle: TextStyle(color: Colors.grey[500]),
    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
    fillColor: Colors.grey.shade100,
    filled: true,
    contentPadding:
    const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
    )
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      maxLength: 10,
      validator: (text) {
        if (text!.isEmpty) {
          return "Please enter a password";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your password',
        hintStyle: TextStyle(color: Colors.grey[500]),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        fillColor: Colors.grey.shade100,
        filled: true,
        contentPadding:
        const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      ),
      onSaved: (value) {
        password = value!;
      },
    );
  }

  Widget _buildSLMCregiNoField() {
    return TextFormField(
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (text) {
        if (text!.isEmpty) {
          return "Please enter SLMC Registration Number";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'SLMC Registration No',
        hintStyle: TextStyle(color: Colors.grey[500]),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        fillColor: Colors.grey.shade100,
        filled: true,
        contentPadding:
        const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      ),
      onSaved: (value) {
        SLMCregiNo = int.parse(value!);
      },
    );
  }

  Widget _buildNICField() {
    return TextFormField(
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (text) {
        if (text!.isEmpty) {
          return "Please enter the NIC";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your NIC',
        hintStyle: TextStyle(color: Colors.grey[500]),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        fillColor: Colors.grey.shade100,
        filled: true,
        contentPadding:
        const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      ),
      onSaved: (value) {
        NIC = int.parse(value!);
      },
    );
  }

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
            children: <Widget>[
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30.0),

              const Text('Full name'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildNameField(),
              ),
              // const SizedBox(height: 20.0),

              const Text('Email Address'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildEmailField(),
              ),
              // const SizedBox(height: 20.0),

              const Text('SLMC Registration No'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildSLMCregiNoField(),
              ),
              // const SizedBox(height: 10.0),


              const Text('NIC'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildNICField(),
              ),
              // const SizedBox(height: 10.0),

              const Text('Password'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildPasswordField(),
              ),
              // const SizedBox(height: 20.0),

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
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Signature'),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Upload the image of the Signature',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 40.0),
                ],
              ),

                  Container(
                    child: Form(
                      key: _formKey,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            registerUser().then((success) {
                              if (success) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInDoc()),
                                );
                              }
                            }
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text('Continue', style: TextStyle(color: Colors.black, fontSize: 15)),
                          ),
                        ),
                      ),
                    ),
                  ),



            ],
          ),
        ))
      ],
    ));
  }

  registerUser() {}
}

class HelperValidator {
  static String? nameValidate(String value) {
    if (value.isEmpty) {
      return "Name can't be empty";
    }
    if (value.length < 2) {
      return "Name must be at least 2 characters long";
    }
    if (value.length > 50) {
      return "Name must be less than 50 characters long";
    }
    return null;
  }
}