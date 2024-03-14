import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_vault/pages/patient/sign_in.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  late String fullName, birthdate, address, email, nic, phoneNumber, password, confirmPassword;

  final _nameController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _nicController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isNotValidate = false;

  Future<bool> registerUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _isNotValidate = false;
      });

      var regBody = {
        "name": _nameController.text,
        "birthdate": _birthdateController.text,
        "address": _addressController.text,
        "email": _emailController.text,
        "NIC": _nicController.text,
        "phonenumber": _phoneNumberController.text,
        "password": _passwordController.text
      };

      try {
        var response = await http.post(
          Uri.parse('http://10.0.2.2:2000/userRegistration'),
          body: json.encode(regBody),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          // Registration successful
          var jsonResponse = jsonDecode(response.body);
          if (jsonResponse['status']) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration successful')),
            );
            return true;
          } else {
            // Registration failed
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Registration failed: ${jsonResponse['message']}')),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error ${response.statusCode}: ${response.reasonPhrase}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
    return false;
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
              padding: const EdgeInsets.fromLTRB(26.0, 50.0, 26.0, 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign Up',
                    style:
                    TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30.0),

                  const Text('Full name'),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.black),
                      errorText: _isNotValidate ? "Please enter your full name" : null,
                      hintText: 'Enter your full name',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                        return 'Please enter a valid full name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      fullName = value!;
                    },
                  ),
                  const SizedBox(height: 20.0),

                  const Text('Date of Birth'),
                  TextFormField(
                    controller: _birthdateController,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.black),
                      errorText: _isNotValidate ? "Please enter your Date of Birth" : null,
                      hintText: 'DD/MM/YYYY',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      // if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      //   return 'Please enter a valid date of birth';
                      // }
                      return null;
                    },
                    onSaved: (value) {
                      birthdate = value!;
                    },
                  ),
                  const SizedBox(height: 20.0),

                  const Text('Address'),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.black),
                      errorText: _isNotValidate ? "Please enter your address" : null,
                      hintText: 'Enter your address',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      // if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      //   return 'Please enter a valid address';
                      // }
                      return null;
                    },
                    onSaved: (value) {
                      address = value!;
                    },
                  ),
                  const SizedBox(height: 20.0),

                  const Text('Email Address'),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.black),
                      errorText: _isNotValidate ? "Enter Proper Info" : null,
                      hintText: 'davidsmith@gmail.com',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                  ),
                  const SizedBox(height: 20.0),

                  const Text('Phone Number'),
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      hintText: '+94 762 090 212',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      FilteringTextInputFormatter.digitsOnly,
                      TelephoneInputFormatter(),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      } else if (value.length != 11) {
                        return 'Phone number must be 11 digits long';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      phoneNumber = value!;
                    },
                  ),
                  const SizedBox(height: 20.0),

                  const Text('NIC'),
                  TextFormField(
                    controller: _nicController,
                    decoration: InputDecoration(
                      hintText: '200468532944',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your NIC';
                      }
                      // Check if NIC is old format (8 digits + 'V' at the end) or new format (12 digits)
                      if (!((value.length == 9 && value.endsWith('V')) ||
                          value.length == 12)) {
                        return 'Enter a valid NIC number';
                      }

                      // Check if NIC is old format (8 digits + 'V' at the end)
                      if (value.length == 9 &&
                          !RegExp(r'^[0-9]{8}V$').hasMatch(value)) {
                        return 'Enter a valid NIC number';
                      }

                      // Check if NIC is new format (12 digits)
                      if (value.length == 12 &&
                          !RegExp(r'^[0-9]{12}$').hasMatch(value)) {
                        return 'Enter a valid NIC number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      nic = value!;
                    },
                  ),
                  const SizedBox(height: 20.0),

                  const Text('Password'),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.white),
                      errorText: _isNotValidate ? "Enter Proper Info" : null,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'Password must contain at least one uppercase letter';
                      }
                      if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return 'Password must contain at least one lowercase letter';
                      }
                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'Password must contain at least one digit';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                  const SizedBox(height: 20.0),

                  const Text('Confirm password'),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      confirmPassword = value!;
                    },
                  ),
                  const SizedBox(height: 30.0),

                  Padding(
                    padding: const EdgeInsets.only(right: 200),
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
                                  MaterialPageRoute(builder: (context) => const SignIn()),
                                );
                              }
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          // width: 200,
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
            ),
          ),
        ],
      ),
    );
  }
}

class TelephoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String value = newValue.text.replaceAll(RegExp(r'\s+'), '');
    String formattedValue = '+94 ';

    if (value.length > 4) {
      formattedValue += value.substring(0, 3) + ' ';
      value = value.substring(3);
    }

    if (value.isNotEmpty) {
      formattedValue += value.substring(0, 7);
    }

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}

bool _isNumeric(String? value) {
  if (value == null) {
    return false;
  }
  return double.tryParse(value) != null;
}