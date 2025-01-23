import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Welcome.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController fullnameController = TextEditingController(text: 'Abdul Samad');
  final TextEditingController phoneController = TextEditingController(text: '+923130028744');
  final TextEditingController cnicController = TextEditingController(text: '42501-0123456-7');
  final TextEditingController emailController = TextEditingController(text: 'samad3316khan@gmail.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // This removes the back button
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Spotlight',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Account Details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A4E65),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: fullnameController,
                      decoration: InputDecoration(
                        labelText: 'Full Name*',
                        labelStyle: const TextStyle(
                          color: Color(0xFF004D61),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      style: const TextStyle(color: Color(0xFF004D61)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email*',
                        labelStyle: const TextStyle(
                          color: Color(0xFF004D61),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      style: const TextStyle(color: Color(0xFF004D61)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number*',
                        labelStyle: const TextStyle(
                          color: Color(0xFF004D61),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      style: const TextStyle(color: Color(0xFF004D61)),
                      readOnly: true, // Make the field non-editable
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: cnicController,
                      decoration: InputDecoration(
                        labelText: 'CNIC*',
                        labelStyle: const TextStyle(
                          color: Color(0xFF004D61),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      style: const TextStyle(color: Color(0xFF004D61)),
                      readOnly: true, // Make the field non-editable
                    ),
                    const SizedBox(height: 160),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 120, // Set the width of the button
                        height: 45, // Set the height of the button
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WelcomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF004D61), // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25), // Border radius
                            ),
                          ),
                          child: const Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
