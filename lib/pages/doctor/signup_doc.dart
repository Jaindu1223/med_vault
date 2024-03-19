import 'package:flutter/material.dart';
import 'package:med_vault/pages/doctor/signin_doc.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CustomTextFormField extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  final String hintText;
  final bool isNotValidated;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String errorMessage;

  const CustomTextFormField({
    Key? key,
    required this.lable,
    required this.controller,
    required this.hintText,
    required this.isNotValidated,
    required this.errorMessage,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          /* style: , */
        ),
        SizedBox(height: 5),
        TextFormField(
          style: const TextStyle(color: Colors.black), // text style ....!
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            errorText: isNotValidated ? errorMessage : null,
            errorStyle: TextStyle(fontSize: 13),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500]),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            fillColor: Colors.grey.shade100,
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
          ),
          validator: validator,
        ),
      ],
    );
  }
}

class SignUpDoc extends StatefulWidget {
  @override
  State<SignUpDoc> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpDoc> {
  final _formKey = GlobalKey<FormState>();

  late String fullName,
      address,
      email,
      nic,
      phoneNumber,
      SLMCregiNo,
      password,
      confirmPassword;

  bool _nameIsNotvalidate = false;
  bool _addressIsNotvalidate = false;
  bool _emailIsNotvalidate = false;
  bool _nicIsNotvalidate = false;
  bool _phoneNumberIsNotvalidate = false;
  bool _SLMCregiNoIsNotvalidate = false;
  bool _passwordIsNotvalidate = false;
  bool _confirPasswordIsNotvalidate = false;

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _nicController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _SLMCregiNoController  = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<bool> registerUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      var regBody = {
        "name": _nameController.text,
        "address": _addressController.text,
        "email": _emailController.text,
        "NIC": _nicController.text,
        "phonenumber": _phoneNumberController.text,
        "SLMCregiNo": _SLMCregiNoController.text,
        "password": _passwordController.text
      };

      try {
        var response = await http.post(
          Uri.parse('http://10.0.2.2:2000/doctorRegistration'),
          body: json.encode(regBody),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          if (jsonResponse['status']) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration successful')),
            );
            return true;
          } else {
            // Display validation errors
            List<dynamic> errors = jsonResponse['errors'];
            String errorMessage = '';
            errors.forEach((error) {
              errorMessage += error['msg'] + '\n';
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(errorMessage)),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                    "An error occurred while processing your request." /* 'Error ${response.statusCode}: ${response.reasonPhrase}' */)),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 34.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30.0),

                    CustomTextFormField(
                      lable: "Full Name",
                      controller: _nameController,
                      hintText: 'Enter your full name',
                      isNotValidated: _nameIsNotvalidate,
                      errorMessage: "This field is required",
                    ),
                    const SizedBox(height: 20.0),

                    CustomTextFormField(
                      lable: "Address",
                      controller: _addressController,
                      hintText: 'Enter your address',
                      isNotValidated: _addressIsNotvalidate,
                      errorMessage: "This field is required",
                    ),
                    const SizedBox(height: 20.0),

                    CustomTextFormField(
                      lable: "Email Address",
                      controller: _emailController,
                      hintText: 'davidsmith@gmail.com',
                      isNotValidated: _emailIsNotvalidate,
                      errorMessage: "This field is required",
                    ),
                    const SizedBox(height: 20.0),

                    CustomTextFormField(
                      lable: "Contact Number",
                      controller: _phoneNumberController,
                      isNotValidated: _phoneNumberIsNotvalidate,
                      errorMessage: "This field is required",
                      hintText: '+94 762 090 212',
                      keyboardType: TextInputType.phone,
                      maxLength: 14,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                        FilteringTextInputFormatter.digitsOnly,
                        TelephoneInputFormatter(),
                      ],
                    ),
                    const SizedBox(height: 20.0),

                    CustomTextFormField(
                      lable: "NIC",
                      controller: _nicController,
                      hintText: '200468532944',
                      isNotValidated: _nicIsNotvalidate,
                      errorMessage: "This field is required",
                    ),
                    const SizedBox(height: 20.0),

                    CustomTextFormField(
                      lable: "SLMC Registration Number",
                      controller: _SLMCregiNoController,
                      hintText: '2546',
                      isNotValidated: _SLMCregiNoIsNotvalidate,
                      errorMessage: "This field is required",
                    ),
                    const SizedBox(height: 20.0),

                    CustomTextFormField(
                      lable: "Password",
                      controller: _passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      isNotValidated: _passwordIsNotvalidate,
                      errorMessage: "This field is required",
                    ),
                    const SizedBox(height: 20.0),

                    CustomTextFormField(
                      lable: "Confirm Password",
                      controller: _confirmPasswordController,
                      hintText: 'Confirm password',
                      obscureText: true,
                      isNotValidated: _confirPasswordIsNotvalidate,
                      errorMessage: "This field is required",
                    ),
                    const SizedBox(height: 30.0),

                    Padding(
                      padding: const EdgeInsets.only(right: 200),
                      child: ElevatedButton(
                        onPressed: () {
                          onTapContinue(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text('Continue',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTapContinue(BuildContext context) {
    bool sendReq = true;
    _nameIsNotvalidate = false;
    _addressIsNotvalidate = false;
    _emailIsNotvalidate = false;
    _phoneNumberIsNotvalidate = false;
    _SLMCregiNoIsNotvalidate = false;
    _nicIsNotvalidate = false;
    _passwordIsNotvalidate = false;
    _confirPasswordIsNotvalidate = false;

    setState(() {
      if (_nameController.text.isEmpty) {
        _nameIsNotvalidate = true;
        sendReq = false;
      }
      if (_addressController.text.isEmpty) {
        _addressIsNotvalidate = true;
        sendReq = false;
      }
      if (_emailController.text.isEmpty) {
        _emailIsNotvalidate = true;
        sendReq = false;
      }
      if (_phoneNumberController.text.isEmpty) {
        _phoneNumberIsNotvalidate = true;
        sendReq = false;
      }
      if (_nicController.text.isEmpty) {
        _nicIsNotvalidate = true;
        sendReq = false;
      }
      if (_SLMCregiNoController.text.isEmpty) {
        _SLMCregiNoIsNotvalidate = true;
        sendReq = false;
      }
      if (_passwordController.text.isEmpty) {
        _passwordIsNotvalidate = true;
        sendReq = false;
      }
      if (_confirmPasswordController.text.isEmpty) {
        _confirPasswordIsNotvalidate = true;
        sendReq = false;
      }
      if (_passwordController.text != _confirmPasswordController.text) {
        _confirmPasswordController.clear();
        _confirPasswordIsNotvalidate = true;
        sendReq = false;
      }
    });

    if (sendReq) {
      registerUser(context).then((success) {
        if (success) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignInDoc()),
          );
        }
      });
    }
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