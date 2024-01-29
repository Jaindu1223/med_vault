import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Align(
        //     alignment: Alignment.center,
        //     child: Text(
        //       'Sign Up',
        //       style: TextStyle(
        //         fontSize: 34.0,
        //       ),
        //     ),
        //   ),
        // ),
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
                  padding: const EdgeInsets.all(26.0), // Add the padding here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 34.0,
                  ),),
                Text('Full name'),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your full name',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                  ),
                ),
                SizedBox(height: 20.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email Address'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter the Email Address',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        contentPadding:
                        EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone Number'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        contentPadding:
                        EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NIC'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your NIC',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        contentPadding:
                        EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Password'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        contentPadding:
                        EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
                SizedBox(height: 20.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Confirm password'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your confirm password',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)
                        ),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        contentPadding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ],
            ),
              )
            )
            ],
        )
        );
  }
}
