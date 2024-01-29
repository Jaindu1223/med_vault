import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Forgot Password'),
      // ),
        body: Stack(
            children: [
              Image.asset(
                'assets/bg_2.png',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),

              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0), // Add padding at the top
                        child: Center(
                          child: Image.asset(
                            'assets/fog.png',
                            height: 260,
                            width: 260,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Don\'t worry! it happens. Please enter the email address associated with your account.',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle email submission here
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            fixedSize: Size(260, 28),
                            foregroundColor: Colors.white,
                            textStyle: TextStyle(
                              fontSize: 18,
                            )
                        ),
                        child: Text('Submit'),
                      ),
                    ],//children
                  ),
                ),
              )
            ]
        )
    );
  }
}